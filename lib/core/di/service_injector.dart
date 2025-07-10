
import 'package:dio/dio.dart';
import 'package:flutter_graphql_subscription_test/core/di/service_locator.dart';
import 'package:flutter_graphql_subscription_test/core/network/dio_factory.dart';
import 'package:flutter_graphql_subscription_test/features/auth/auth_injection.dart';

void initServiceLocator() {
  serviceLocator.registerLazySingleton<Dio>(() => DioFactory().getDio());

  _initDataSources();
  _initRepositories();
  _initUseCases();
  _initBlocs();
  _initServices();
}

void _initDataSources() {
  injectAuthRemoteDataSources();
}

void _initRepositories() {
  injectAuthRepositories();
}

void _initUseCases() {
  injectAuthUseCases();
}

void _initBlocs() {
  injectAuthBlocs();
}

void _initServices() {
}