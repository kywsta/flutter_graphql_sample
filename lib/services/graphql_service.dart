import 'package:graphql_flutter/graphql_flutter.dart';
import 'auth_service.dart';

class GraphQLService {
  static final GraphQLService _instance = GraphQLService._internal();
  factory GraphQLService() => _instance;
  GraphQLService._internal();

  static const String graphqlEndpoint = 'http://192.168.1.12:3000/graphql';
  static const String subscriptionEndpoint = 'ws://192.168.1.12:3000/graphql';

  GraphQLClient? _client;

  GraphQLClient get client {
    if (_client == null) {
      _initializeClient();
    }
    return _client!;
  }

  void _initializeClient() {
    final HttpLink httpLink = HttpLink(graphqlEndpoint);
    
    final WebSocketLink websocketLink = WebSocketLink(
      subscriptionEndpoint,
      config: SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: const Duration(seconds: 30),
        initialPayload: () async {
          final token = AuthService().token;
          if (token != null) {
            return {'Authorization': 'Bearer $token'};
          }
          return {};
        },
      ),
    );

    final AuthLink authLink = AuthLink(
      getToken: () async {
        final token = AuthService().token;
        return token != null ? 'Bearer $token' : null;
      },
    );

    final Link link = Link.split(
      (request) => request.isSubscription,
      websocketLink,
      authLink.concat(httpLink),
    );

    _client = GraphQLClient(
      link: link,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  void reinitializeClient() {
    _client = null;
    _initializeClient();
  }

  // GraphQL Queries
  static const String getUserChatsQuery = '''
    query GetUserChats {
      getUserChats {
        id
        name
        creatorId
        memberIds
        isGroup
        lastMessageId
        createdAt
        updatedAt
      }
    }
  ''';

  static const String getChatMessagesQuery = '''
    query GetChatMessages(\$chatId: String!, \$limit: Int, \$offset: Int) {
      getChatMessages(chatId: \$chatId, limit: \$limit, offset: \$offset) {
        id
        chatId
        userId
        content
        type
        replyToId
        createdAt
        updatedAt
      }
    }
  ''';

  static const String meQuery = '''
    query Me {
      me {
        id
        username
        email
        isActive
        createdAt
      }
    }
  ''';

  // GraphQL Mutations
  static const String sendMessageMutation = '''
    mutation SendMessage(\$input: SendMessageInput!) {
      sendMessage(input: \$input) {
        id
        chatId
        userId
        content
        type
        createdAt
      }
    }
  ''';

  static const String createChatMutation = '''
    mutation CreateChat(\$input: CreateChatInput!) {
      createChat(input: \$input) {
        id
        name
        creatorId
        memberIds
        isGroup
        createdAt
      }
    }
  ''';

  // GraphQL Subscriptions
  static const String messageAddedSubscription = '''
    subscription MessageAdded(\$chatId: String!) {
      messageAdded(chatId: \$chatId) {
        id
        chatId
        userId
        content
        type
        createdAt
      }
    }
  ''';

  static const String typingIndicatorSubscription = '''
    subscription TypingIndicator(\$chatId: String!) {
      typingIndicator(chatId: \$chatId) {
        chatId
        userId
        isTyping
      }
    }
  ''';
} 