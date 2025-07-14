import 'package:dio/dio.dart';
import 'package:flutter_graphql_sample/core/di/service_locator.dart';
import 'package:flutter_graphql_sample/core/graphql/graphql_service.dart';
import 'package:flutter_graphql_sample/core/network/dio_factory.dart';
import 'package:flutter_graphql_sample/features/auth/auth_injections.dart';
import 'package:flutter_graphql_sample/features/chat/chat_injections.dart';

void initServiceLocator() {
  serviceLocator.registerLazySingleton<Dio>(() => DioFactory().getDio());

  serviceLocator.registerLazySingleton<GraphQLService>(() => GraphQLService());

  _initDataSources();
  _initRepositories();
  _initUseCases();
  _initBlocs();
  _initServices();
}

void _initDataSources() {
  injectAuthRemoteDataSources();
  injectChatDataSources();
}

void _initRepositories() {
  injectAuthRepositories();
  injectChatRepositories();
}

void _initUseCases() {
  injectAuthUseCases();
  injectChatUseCases();
}

void _initBlocs() {
  injectAuthBlocs();
  injectChatBlocs();
}

void _initServices() {}
