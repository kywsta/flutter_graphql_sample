class UserEntity {
  final String id;
  final String username;
  final String? email;
  final DateTime createdAt;
  final bool isActive;

  const UserEntity({
    required this.id,
    required this.username,
    this.email,
    required this.createdAt,
    required this.isActive,
  });
}
