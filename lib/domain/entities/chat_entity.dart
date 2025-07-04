import 'package:json_annotation/json_annotation.dart';
import 'base/data_entity.dart';

part 'chat_entity.g.dart';

@JsonSerializable()
class ChatEntity extends DataEntity {
  final String name;
  final String creatorId;
  final List<String> memberIds;
  final bool isGroup;
  final String? lastMessageId;

  const ChatEntity({
    required super.id,
    required this.name,
    required this.creatorId,
    required this.memberIds,
    required this.isGroup,
    this.lastMessageId,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ChatEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatEntityFromJson(json);
      
  @override
  Map<String, dynamic> toJson() => _$ChatEntityToJson(this);
}
