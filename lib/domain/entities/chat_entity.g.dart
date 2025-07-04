// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatEntity _$ChatEntityFromJson(Map<String, dynamic> json) => ChatEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      creatorId: json['creatorId'] as String,
      memberIds:
          (json['memberIds'] as List<dynamic>).map((e) => e as String).toList(),
      isGroup: json['isGroup'] as bool,
      lastMessageId: json['lastMessageId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ChatEntityToJson(ChatEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'name': instance.name,
      'creatorId': instance.creatorId,
      'memberIds': instance.memberIds,
      'isGroup': instance.isGroup,
      'lastMessageId': instance.lastMessageId,
    };
