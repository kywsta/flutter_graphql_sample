import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_sample/core/error/failures.dart';
import 'package:flutter_graphql_sample/core/graphql/schema.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/get_chats.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/message_added.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/typing_indicator.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/use_cases/get_chat_messages_use_case.dart';
import 'package:flutter_graphql_sample/features/chat/domain/use_cases/send_message_use_case.dart';
import 'package:flutter_graphql_sample/features/chat/domain/use_cases/set_typing_status_use_case.dart';
import 'package:flutter_graphql_sample/features/chat/domain/use_cases/subscribe_message_added_use_case.dart';
import 'package:flutter_graphql_sample/features/chat/domain/use_cases/subscribe_typing_indicator_use_case.dart';

part 'chat_detail_event.dart';
part 'chat_detail_state.dart';

const int _chatMessagesLimit = 20;

class ChatDetailBloc extends Bloc<ChatDetailEvent, ChatDetailState> {
  final Query$GetChats$getChats$edges$node chat;

  final GetChatMessagesUseCase getChatMessagesUseCase;
  final SendMessageUseCase sendMessageUseCase;
  final SetTypingStatusUseCase setTypingStatusUseCase;
  final SubscribeMessageAddedUseCase subscribeMessageAddedUseCase;
  final SubscribeTypingIndicatorUseCase subscribeTypingIndicatorUseCase;

  StreamSubscription<Subscription$MessageAdded>? _messageAddedSubscription;
  StreamSubscription<Subscription$TypingIndicator>?
      _typingIndicatorSubscription;

  ChatDetailBloc({
    required this.chat,
    required this.getChatMessagesUseCase,
    required this.sendMessageUseCase,
    required this.setTypingStatusUseCase,
    required this.subscribeMessageAddedUseCase,
    required this.subscribeTypingIndicatorUseCase,
  }) : super(ChatDetailState(chat: chat)) {
    on<GetChatMessages>(_onGetChatMessages);
    on<SendMessage>(_onSendMessage);
    on<SetTypingStatus>(_onSetTypingStatus);
    on<MessageAdded>(_onMessageAdded);
    on<TypingIndicatorReceived>(_onTypingIndicatorReceived);

    _initSubscriptions();
  }

  void _initSubscriptions() {
    _messageAddedSubscription?.cancel();
    _typingIndicatorSubscription?.cancel();

    _messageAddedSubscription =
        subscribeMessageAddedUseCase.call(chat.id).listen((event) {
      add(MessageAdded(message: event.messageAdded));
    });

    _typingIndicatorSubscription =
        subscribeTypingIndicatorUseCase.call(chat.id).listen((event) {
      add(TypingIndicatorReceived(typingIndicator: event.typingIndicator));
    });
  }

  Future<void> _onGetChatMessages(
      GetChatMessages event, Emitter<ChatDetailState> emit) async {
    if (state.hasReachedMax) return;

    final result = await getChatMessagesUseCase.call(
        chat.id, _chatMessagesLimit, state.cursor);

    result.fold((data) {
      final oldMessages =
          data.getChatMessages.edges.map((e) => e.node).toList();
      final messages = <Fragment$message>[
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

  Future<void> _onSendMessage(
      SendMessage event, Emitter<ChatDetailState> emit) async {
    final result = await sendMessageUseCase.call(chat.id, event.message);

    result.fold((data) {
      emit(state.copyWith(status: ChatDetailStatus.loaded));
    }, (failure) {
      emit(state.copyWith(sendMessageFailure: failure));
    });
  }

  Future<void> _onSetTypingStatus(
      SetTypingStatus event, Emitter<ChatDetailState> emit) async {
    setTypingStatusUseCase.call(chat.id, event.isTyping);
  }

  Future<void> _onMessageAdded(
      MessageAdded event, Emitter<ChatDetailState> emit) async {
    final currentMessages = state.messages;
    final newMessages = <Fragment$message>[
      ...currentMessages,
      event.message,
    ];
    emit(state.copyWith(messages: newMessages));
  }

  Future<void> _onTypingIndicatorReceived(
      TypingIndicatorReceived event, Emitter<ChatDetailState> emit) async {}
}
