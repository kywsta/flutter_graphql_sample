import 'package:dio/dio.dart';
import 'package:flutter_graphql_subscription_test/core/di/service_locator.dart';
import 'package:flutter_graphql_subscription_test/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:flutter_graphql_subscription_test/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_graphql_subscription_test/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_graphql_subscription_test/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_graphql_subscription_test/features/auth/domain/use_cases/register_use_case.dart';
import 'package:flutter_graphql_subscription_test/features/auth/presentation/bloc/auth_bloc.dart';

void injectAuthRemoteDataSources() {
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: serviceLocator<Dio>()),
  );
}

void injectAuthRepositories() {
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      dataSource: serviceLocator<AuthRemoteDataSource>(),
    ),
  );
}

void injectAuthUseCases() {
  serviceLocator.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(repository: serviceLocator<AuthRepository>()),
  );

  serviceLocator.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(repository: serviceLocator<AuthRepository>()),
  );
}

void injectAuthBlocs() {
  serviceLocator.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      loginUseCase: serviceLocator<LoginUseCase>(),
      registerUseCase: serviceLocator<RegisterUseCase>(),
    ),
  );
}