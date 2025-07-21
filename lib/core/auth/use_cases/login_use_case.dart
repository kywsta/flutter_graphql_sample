import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_sample/core/auth/models/user_auth_model.dart';
import 'package:flutter_graphql_sample/core/auth/repositories/auth_repository.dart';
import 'package:flutter_graphql_sample/core/error/failures.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  Future<Either<UserAuthModel, Failure>> call(
      String userName, String password) async {
    return await repository.login(userName, password);
  }
}
