import 'package:flutter_graphql_sample/core/di/service_locator.dart';
import 'package:flutter_graphql_sample/core/graphql/graphql_service.dart';
import 'package:flutter_graphql_sample/features/chat/data/data_sources/chat_remote_data_source.dart';
import 'package:flutter_graphql_sample/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:flutter_graphql_sample/features/chat/domain/repositories/chat_repository.dart';
import 'package:flutter_graphql_sample/features/chat/domain/use_cases/get_chat_use_case.dart';
import 'package:flutter_graphql_sample/features/chat/domain/use_cases/get_chats_use_case.dart';

void injectChatDataSources() {
  serviceLocator.registerLazySingleton<ChatRemoteDataSource>(() =>
      ChatRemoteDataSourceImpl(
          graphQLService: serviceLocator.get<GraphQLService>()));
}

void injectChatRepositories() {
  serviceLocator.registerLazySingleton<ChatRepository>(() => ChatRepositoryImpl(
      chatRemoteDataSource: serviceLocator.get<ChatRemoteDataSource>()));
}

void injectChatUseCases() {
  serviceLocator.registerLazySingleton<GetChatsUseCase>(() =>
      GetChatsUseCase(chatRepository: serviceLocator.get<ChatRepository>()));

  serviceLocator.registerLazySingleton<GetChatUseCase>(() =>
      GetChatUseCase(chatRepository: serviceLocator.get<ChatRepository>()));
}
