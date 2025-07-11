import 'dart:convert';

import 'package:flutter_graphql_sample/features/chat/domain/graphql/get_chat_messages.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/get_chats.graphql.dart';

class ChatRepository {
  static const getChatsResponse = r"""
{
  "data": {
    "getChats": {
      "edges": [
        {
          "cursor": "MjAyNC0wMS0wMVQxNTozMDowMC4wMDBaX2NoYXRfMQ==",
          "node": {
            "id": "chat_1",
            "name": "General Discussion",
            "memberIds": [
              "1",
              "2",
              "3",
              "4",
              "5"
            ],
            "isGroup": true,
            "createdAt": "2024-01-01T12:00:00.000Z",
            "updatedAt": "2024-01-01T15:30:00.000Z"
          }
        },
        {
          "cursor": "MjAyNC0wMS0wMVQxNjoxNTowMC4wMDBaX2NoYXRfMg==",
          "node": {
            "id": "chat_2",
            "name": "Project Alpha",
            "memberIds": [
              "2",
              "3",
              "4"
            ],
            "isGroup": true,
            "createdAt": "2024-01-01T13:00:00.000Z",
            "updatedAt": "2024-01-01T16:15:00.000Z"
          }
        },
        {
          "cursor": "MjAyNC0wMS0wMVQxNzowMDowMC4wMDBaX2NoYXRfMw==",
          "node": {
            "id": "chat_3",
            "name": "Alice & Bob",
            "memberIds": [
              "1",
              "2"
            ],
            "isGroup": false,
            "createdAt": "2024-01-01T14:00:00.000Z",
            "updatedAt": "2024-01-01T17:00:00.000Z"
          }
        }
      ],
      "pageInfo": {
        "startCursor": "MjAyNC0wMS0wMVQxNTozMDowMC4wMDBaX2NoYXRfMQ==",
        "endCursor": "MjAyNC0wMS0wMVQxNzowMDowMC4wMDBaX2NoYXRfMw==",
        "hasNextPage": false,
        "hasPreviousPage": false
      },
      "totalCount": 3
    }
  }
}
""";

  static const getChatMessagesResponse = r"""
{
  "data": {
    "getChatMessages": {
      "edges": [
        {
          "cursor": "MjAyNS0wNi0yOFQwMzoxNzoyOC4xMDFaX21zZ18xNQ==",
          "node": {
            "id": "msg_15",
            "type": "TEXT",
            "userId": "1",
            "content": "Hey Alice! How are you doing?",
            "createdAt": "2025-06-28T03:17:28.101Z",
            "replyToId": null
          }
        },
        {
          "cursor": "MjAyNS0wNi0yOFQwMzoyNDoyOC4xMDFaX21zZ18xNg==",
          "node": {
            "id": "msg_16",
            "type": "TEXT",
            "userId": "2",
            "content": "Hi Bob! I'm doing great, thanks for asking!",
            "createdAt": "2025-06-28T03:24:28.101Z",
            "replyToId": null
          }
        },
        {
          "cursor": "MjAyNS0wNi0yOFQwMzozNDoyOC4xMDFaX21zZ18xNw==",
          "node": {
            "id": "msg_17",
            "type": "TEXT",
            "userId": "1",
            "content": "That's awesome! What have you been up to lately?",
            "createdAt": "2025-06-28T03:34:28.101Z",
            "replyToId": null
          }
        }
      ],
      "pageInfo": {
        "hasPreviousPage": true,
        "startCursor": "MjAyNS0wNi0yOFQwMzoxNzoyOC4xMDFaX21zZ18xNQ==",
        "hasNextPage": true,
        "endCursor": "MjAyNS0wNi0yOFQwMzozNDoyOC4xMDFaX21zZ18xNw=="
      },
      "totalCount": 53
    }
  }
}
""";

  ChatRepository();

  Future<List<Query$GetChats$getChats$edges$node>> getChats() async {
    final mockResponseJson = jsonDecode(getChatsResponse);

    var result = Query$GetChats.fromJson(mockResponseJson);

    for (var edge in result.getChats.edges) {
      print(edge.node.toJson());
    }

    return result.getChats.edges.map((edge) => edge.node).toList();
  }

  Future<Query$GetChatMessages> getChatMessages(String chatId) async {
    final mockResponseJson = jsonDecode(getChatMessagesResponse);

    return Query$GetChatMessages.fromJson(mockResponseJson);
  }
}
