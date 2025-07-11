import 'package:flutter_graphql_sample/features/chat/domain/graphql/get_chat_messages.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/message_added.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/send_message.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/typing_indicator.graphql.dart';

abstract class MessageGQLDataSource {
  Future<Query$GetChatMessages> getChatMessages(String chatId);
  Future<Mutation$SendMessage> sendMessage(String chatId, String message);
  Stream<Subscription$MessageAdded> subscribeMessageAdded(String chatId);
  Stream<Subscription$TypingIndicator> subscribeTypingIndicator(String chatId);
}