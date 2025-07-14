part of 'chat_detail_bloc.dart';

enum ChatDetailStatus {
  initial,
  firstPageLoaded,
  loaded,
}

class ChatDetailState extends Equatable {
  final Query$GetChats$getChats$edges$node chat;

  final ChatDetailStatus status;
  final List<Query$GetChatMessages$getChatMessages$edges$node> messages;
  final bool hasReachedMax;
  final String? cursor;

  final Failure? loadingMessagesFailure;

  final bool sendingMessage;

  const ChatDetailState({
    required this.chat,
    this.status = ChatDetailStatus.initial,
    this.messages = const [],
    this.hasReachedMax = false,
    this.cursor,
    this.loadingMessagesFailure,
    this.sendingMessage = false,
  });

  @override
  List<Object?> get props => [
        chat,
        status,
        messages,
        hasReachedMax,
        cursor,
        loadingMessagesFailure,
        sendingMessage
      ];

  ChatDetailState copyWith({
    ChatDetailStatus? status,
    List<Query$GetChatMessages$getChatMessages$edges$node>? messages,
    bool? hasReachedMax,
    String? cursor,
    Failure? loadingMessagesFailure,
  }) {
    return ChatDetailState(
        chat: chat,
        status: status ?? this.status,
        messages: messages ?? this.messages,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        cursor: cursor ?? this.cursor,
        loadingMessagesFailure:
            loadingMessagesFailure ?? this.loadingMessagesFailure);
  }
}
