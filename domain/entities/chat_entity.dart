class ChatEntity {
  final String id;
  final String name;
  final String creatorId;
  final List<String> memberIds;
  final bool isGroup;
  final String? lastMessageId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ChatEntity({
    required this.id,
    required this.name,
    required this.creatorId,
    required this.memberIds,
    required this.isGroup,
    this.lastMessageId,
    required this.createdAt,
    required this.updatedAt,
  });
}
