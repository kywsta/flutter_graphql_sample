import 'package:flutter_graphql_sample/core/auth/repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase({required this.repository});

  void call() {
    repository.logout();
  }
}
