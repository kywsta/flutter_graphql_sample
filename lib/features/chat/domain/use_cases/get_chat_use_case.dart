import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_sample/core/error/failures.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/get_chat.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/repositories/chat_repository.dart';

class GetChatUseCase {
  final ChatRepository chatRepository;

  GetChatUseCase({required this.chatRepository});

  Future<Either<Query$GetChat, Failure>> call(String chatId) async {
    return await chatRepository.getChat(chatId);
  }
}
