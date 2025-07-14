import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_sample/core/error/failures.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/get_chat_messages.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/get_chats.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/use_cases/get_chat_messages_use_case.dart';

part 'chat_detail_event.dart';
part 'chat_detail_state.dart';

const int _chatMessagesLimit = 20;

class ChatDetailBloc extends Bloc<ChatDetailEvent, ChatDetailState> {
  final Query$GetChats$getChats$edges$node chat;
  final GetChatMessagesUseCase getChatMessagesUseCase;

  ChatDetailBloc({required this.chat, required this.getChatMessagesUseCase})
      : super(ChatDetailState(chat: chat)) {
    on<GetChatMessages>(_onGetChatMessages);
  }

  Future<void> _onGetChatMessages(
      GetChatMessages event, Emitter<ChatDetailState> emit) async {
    if (state.hasReachedMax) return;

    final result = await getChatMessagesUseCase.call(
        chat.id, _chatMessagesLimit, state.cursor);

    result.fold((data) {
      final oldMessages =
          data.getChatMessages.edges.map((e) => e.node).toList();
      final messages = <Query$GetChatMessages$getChatMessages$edges$node>[
        ...state.messages,
        ...oldMessages.reversed,
      ];
      final hasReachedMax = !data.getChatMessages.pageInfo.hasPreviousPage;
      final cursor = data.getChatMessages.pageInfo.startCursor;

      emit(
        state.copyWith(
          status: messages.length <= _chatMessagesLimit
              ? ChatDetailStatus.firstPageLoaded
              : ChatDetailStatus.loaded,
          messages: messages,
          hasReachedMax: hasReachedMax,
          cursor: cursor,
        ),
      );
    }, (failure) {
      emit(
        state.copyWith(
          loadingMessagesFailure: failure,
        ),
      );
    });
  }
}
