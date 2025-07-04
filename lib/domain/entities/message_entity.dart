// ignore_for_file: constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'base/data_entity.dart';

part 'message_entity.g.dart';

enum MessageType {
  TEXT,
  IMAGE,
  FILE,
  SYSTEM,
}

@JsonSerializable()
class MessageEntity extends DataEntity {
  final String chatId;
  final String userId;
  final String content;
  final MessageType type;
  final String? replyToId;

  const MessageEntity({
    required super.id,
    required this.chatId,
    required this.userId,
    required this.content,
    required this.type,
    this.replyToId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory MessageEntity.fromJson(Map<String, dynamic> json) =>
      _$MessageEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MessageEntityToJson(this);
}
