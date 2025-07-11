import 'package:dartz/dartz.dart';
import 'package:flutter_graphql_sample/core/error/failures.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/send_message.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/repositories/message_repository.dart';

class SendMessageUseCase {
  final MessageRepository messageRepository;

  SendMessageUseCase({required this.messageRepository});

  Future<Either<Mutation$SendMessage, Failure>> call(String chatId, String message) async {
    return await messageRepository.sendMessage(chatId, message);
  }
}