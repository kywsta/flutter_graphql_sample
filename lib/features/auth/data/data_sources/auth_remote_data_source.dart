import 'package:dio/dio.dart';
import 'package:flutter_graphql_sample/core/constants/network.dart';
import 'package:flutter_graphql_sample/features/auth/domain/models/login_model.dart';
import 'package:flutter_graphql_sample/features/auth/domain/models/register_model.dart';
import 'package:flutter_graphql_sample/core/auth/models/user_auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserAuthModel> login(LoginModel loginModel);
  Future<UserAuthModel> register(RegisterModel registerModel);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserAuthModel> login(LoginModel loginModel) async {
    final url = NetworkConstants.login;

    final response = await dio.post(url, data: loginModel.toJson());

    return UserAuthModel.fromJson(response.data);
  }

  @override
  Future<UserAuthModel> register(RegisterModel registerModel) async {
    final url = NetworkConstants.register;

    final response = await dio.post(url, data: registerModel.toJson());

    return UserAuthModel.fromJson(response.data);
  }
}
