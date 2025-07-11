import 'dart:convert';

import 'package:flutter_graphql_sample/features/chat/domain/graphql/get_chat_messages.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/get_chats.graphql.dart';

abstract class ChatRepository {
  Future<Query$GetChats> getChats();
  
}
