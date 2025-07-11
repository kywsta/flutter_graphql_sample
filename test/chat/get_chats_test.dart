import 'package:flutter_graphql_sample/features/chat/domain/repositories/chat_repository.dart';
import 'package:test/test.dart';

void main() {
  test("Get Chats", () async {
    final chats = await ChatRepository().getChats();
    expect(chats, isNotEmpty);
    for (var chat in chats) {
      print(chat.toJson());
      expect(chat.id, isNotEmpty);
    }

    expect(chats.first.id, "chat_1");
    expect(chats.first.name, "General Discussion");
    expect(chats.first.memberIds, ["1", "2", "3", "4", "5"]);
    expect(chats.first.isGroup, true);
  });

  test("Get Chat Messages", () async {
    final queryResult = await ChatRepository().getChatMessages("chat_1");
    expect(queryResult.getChatMessages.edges, isNotEmpty);
    for (var edge in queryResult.getChatMessages.edges) {
      print(edge.node.toJson());
    }
  });
}
