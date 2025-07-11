part of 'chat_list_bloc.dart';

enum ChatListStatus {
  initial,
  loaded,
}

class ChatListState extends Equatable {
  final ChatListStatus status;
  final List<Query$GetChats$getChats$edges$node> chats;
  final bool hasReachedMax;
  final String? cursor;

  final Failure? failure;
  final bool isLoadingMore;

  const ChatListState({
    this.status = ChatListStatus.initial,
    this.chats = const [],
    this.hasReachedMax = false,
    this.cursor,
    this.failure,
    this.isLoadingMore = false,
  });

  @override
  List<Object?> get props => [status, chats, hasReachedMax, cursor, failure, isLoadingMore];

  @override
  String toString() {
    return "ChatListState{status: $status, chats: ${chats.length}, hasReachedMax: $hasReachedMax, failure: ${failure?.toString()}, isLoadingMore: $isLoadingMore}";
  }

  ChatListState copyWith({
    ChatListStatus? status,
    List<Query$GetChats$getChats$edges$node>? chats,
    bool? hasReachedMax,
    String? cursor,
    Failure? failure,
    bool? isLoadingMore,
  }) {
    return ChatListState(
      status: status ?? this.status,
      chats: chats ?? this.chats,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      cursor: cursor ?? this.cursor,
      failure: failure ?? this.failure,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}
