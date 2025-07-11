import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_sample/core/error/failures.dart';
import 'package:flutter_graphql_sample/features/auth/domain/models/login_model.dart';
import 'package:flutter_graphql_sample/core/auth/models/user_auth_model.dart';
import 'package:flutter_graphql_sample/features/auth/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  Future<Either<UserAuthModel, Failure>> call(LoginModel loginModel) async {
    return await repository.login(loginModel);
  }
}
