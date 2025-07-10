import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_subscription_test/core/error/failures.dart';
import 'package:flutter_graphql_subscription_test/features/auth/domain/models/register_model.dart';
import 'package:flutter_graphql_subscription_test/core/auth/models/user_auth_model.dart';
import 'package:flutter_graphql_subscription_test/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase({required this.repository});

  Future<Either<UserAuthModel, Failure>> call(
      RegisterModel registerModel) async {
    return await repository.register(registerModel);
  }
}
