import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_sample/core/auth/models/user_auth_model.dart';
import 'package:flutter_graphql_sample/core/auth/repositories/auth_repository.dart';
import 'package:flutter_graphql_sample/core/error/failures.dart';
import 'package:flutter_graphql_sample/features/auth/data/data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<UserAuthModel, Failure>> login(
      String userName, String password) async {
    final result =
        await on(() async => await dataSource.login(userName, password));

    result.fold(
      (userAuth) => authState = userAuth,
      (failure) => authState = null,
    );

    return result;
  }

  @override
  Future<void> logout() async {
    authState = null;
  }
}
