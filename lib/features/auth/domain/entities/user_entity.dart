import 'package:json_annotation/json_annotation.dart';
import '../../../../core/base/data_entity.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity extends DataEntity {
  final String username;
  final String? email;

  const UserEntity({
    required super.id,
    required this.username,
    this.email,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
