import 'package:flutter_graphql_sample/features/chat/domain/graphql/typing_indicator.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/repositories/message_repository.dart';

class SubscribeTypingIndicatorUseCase {
  final MessageRepository messageRepository;

  SubscribeTypingIndicatorUseCase({required this.messageRepository});

  Stream<Subscription$TypingIndicator> call(String chatId) {
    return messageRepository.subscribeTypingIndicator(chatId);
  }
}
