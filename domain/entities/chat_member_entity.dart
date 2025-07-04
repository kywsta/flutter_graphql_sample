enum ChatMemberRole {
  ADMIN,
  MEMBER,
}

class ChatMemberEntity {
  final String id;
  final String chatId;
  final String userId;
  final ChatMemberRole role;
  final DateTime joinedAt;
  final bool isActive;

  const ChatMemberEntity({
    required this.id,
    required this.chatId,
    required this.userId,
    required this.role,
    required this.joinedAt,
    required this.isActive,
  });
}
