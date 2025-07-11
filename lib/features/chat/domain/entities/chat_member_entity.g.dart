// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_member_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMemberEntity _$ChatMemberEntityFromJson(Map<String, dynamic> json) =>
    ChatMemberEntity(
      id: json['id'] as String,
      chatId: json['chatId'] as String,
      userId: json['userId'] as String,
      role: $enumDecode(_$ChatMemberRoleEnumMap, json['role']),
      joinedAt: DateTime.parse(json['joinedAt'] as String),
      isActive: json['isActive'] as bool,
    );

Map<String, dynamic> _$ChatMemberEntityToJson(ChatMemberEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatId': instance.chatId,
      'userId': instance.userId,
      'role': _$ChatMemberRoleEnumMap[instance.role]!,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'isActive': instance.isActive,
    };

const _$ChatMemberRoleEnumMap = {
  ChatMemberRole.ADMIN: 'ADMIN',
  ChatMemberRole.MEMBER: 'MEMBER',
};
