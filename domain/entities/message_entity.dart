enum MessageType {
  TEXT,
  IMAGE,
  FILE,
  SYSTEM,
}

class MessageEntity {
  final String id;
  final String chatId;
  final String userId;
  final String content;
  final MessageType type;
  final String? replyToId;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const MessageEntity({
    required this.id,
    required this.chatId,
    required this.userId,
    required this.content,
    required this.type,
    this.replyToId,
    required this.createdAt,
    this.updatedAt,
  });
}
