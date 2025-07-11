import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_sample/core/error/failures.dart';
import 'package:flutter_graphql_sample/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_graphql_sample/features/auth/domain/models/register_model.dart';
import 'package:flutter_graphql_sample/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_graphql_sample/features/auth/domain/models/login_model.dart';
import 'package:flutter_graphql_sample/core/auth/models/user_auth_model.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<UserAuthModel, Failure>> login(LoginModel loginModel) async {
    return await on(() async => await dataSource.login(loginModel));
  }

  @override
  Future<Either<UserAuthModel, Failure>> register(
      RegisterModel registerModel) async {
    return await on(() async => await dataSource.register(registerModel));
  }
}
