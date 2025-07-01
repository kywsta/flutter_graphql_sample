class User {
  final String id;
  final String username;
  final String? email;
  final bool isActive;
  final DateTime createdAt;

  User({
    required this.id,
    required this.username,
    this.email,
    required this.isActive,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      username: json['username'],
      email: json['email'],
      isActive: json['isActive'] ?? true,
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}

class Chat {
  final String id;
  final String name;
  final String creatorId;
  final List<String> memberIds;
  final bool isGroup;
  final String? lastMessageId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Chat({
    required this.id,
    required this.name,
    required this.creatorId,
    required this.memberIds,
    required this.isGroup,
    this.lastMessageId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'].toString(),
      name: json['name'],
      creatorId: json['creatorId'].toString(),
      memberIds: List<String>.from(json['memberIds'].map((id) => id.toString())),
      isGroup: json['isGroup'],
      lastMessageId: json['lastMessageId']?.toString(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'creatorId': creatorId,
      'memberIds': memberIds,
      'isGroup': isGroup,
      'lastMessageId': lastMessageId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

enum MessageType { text, image, file, system }

class Message {
  final String id;
  final String chatId;
  final String userId;
  final String content;
  final MessageType type;
  final String? replyToId;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Message({
    required this.id,
    required this.chatId,
    required this.userId,
    required this.content,
    required this.type,
    this.replyToId,
    required this.createdAt,
    this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'].toString(),
      chatId: json['chatId'].toString(),
      userId: json['userId'].toString(),
      content: json['content'],
      type: _parseMessageType(json['type']),
      replyToId: json['replyToId']?.toString(),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  static MessageType _parseMessageType(String type) {
    switch (type.toUpperCase()) {
      case 'TEXT':
        return MessageType.text;
      case 'IMAGE':
        return MessageType.image;
      case 'FILE':
        return MessageType.file;
      case 'SYSTEM':
        return MessageType.system;
      default:
        return MessageType.text;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chatId': chatId,
      'userId': userId,
      'content': content,
      'type': type.name.toUpperCase(),
      'replyToId': replyToId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

class ChatMember {
  final String id;
  final String chatId;
  final String userId;
  final String role;
  final DateTime joinedAt;
  final bool isActive;

  ChatMember({
    required this.id,
    required this.chatId,
    required this.userId,
    required this.role,
    required this.joinedAt,
    required this.isActive,
  });

  factory ChatMember.fromJson(Map<String, dynamic> json) {
    return ChatMember(
      id: json['id'].toString(),
      chatId: json['chatId'].toString(),
      userId: json['userId'].toString(),
      role: json['role'],
      joinedAt: DateTime.parse(json['joinedAt']),
      isActive: json['isActive'] ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chatId': chatId,
      'userId': userId,
      'role': role,
      'joinedAt': joinedAt.toIso8601String(),
      'isActive': isActive,
    };
  }
} 