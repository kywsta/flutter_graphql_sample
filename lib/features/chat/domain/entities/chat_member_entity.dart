// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import '../../../../core/base/data_entity.dart';

part 'chat_member_entity.g.dart';

enum ChatMemberRole {
  ADMIN,
  MEMBER,
}

@JsonSerializable()
class ChatMemberEntity extends DataEntity {
  final String chatId;
  final String userId;
  final ChatMemberRole role;
  final DateTime joinedAt;
  final bool isActive;

  const ChatMemberEntity({
    required super.id,
    required this.chatId,
    required this.userId,
    required this.role,
    required this.joinedAt,
    required this.isActive,
  }) : super(createdAt: joinedAt, updatedAt: joinedAt);

  factory ChatMemberEntity.fromJson(Map<String, dynamic> json) => _$ChatMemberEntityFromJson(json);
  
  @override
  Map<String, dynamic> toJson() => _$ChatMemberEntityToJson(this);
}
