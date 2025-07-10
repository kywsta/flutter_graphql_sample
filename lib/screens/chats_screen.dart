import 'package:flutter/material.dart';
import 'package:flutter_graphql_subscription_test/core/auth/auth_session.dart';
import 'package:flutter_graphql_subscription_test/core/di/service_locator.dart';
import 'package:flutter_graphql_subscription_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../core/network/graphql_service.dart';
import 'chat_detail_screen.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(GraphQLService().client),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chats'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                _showUserInfo(context);
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _logout();
              },
            ),
          ],
        ),
        body: Query(
          options: QueryOptions(
            document: gql(GraphQLService.getUserChatsQuery),
            fetchPolicy: FetchPolicy.cacheAndNetwork,
          ),
          builder: (QueryResult result,
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            if (result.hasException) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      size: 64,
                      color: Colors.red[300],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error loading chats',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      result.exception.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: refetch,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            if (result.isLoading && result.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final chats = result.data?['getUserChats'] as List<dynamic>? ?? [];

            if (chats.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No chats yet',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Create a chat to get started',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              );
            }

            return RefreshIndicator(
              onRefresh: () async {
                refetch?.call();
              },
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return _buildChatTile(chat);
                },
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showCreateChatDialog();
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildChatTile(Map<String, dynamic> chat) {
    final chatName = chat['name'] as String;
    final isGroup = chat['isGroup'] as bool;
    final memberCount = (chat['memberIds'] as List).length;
    final createdAt = DateTime.parse(chat['createdAt'] as String);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(
            isGroup ? Icons.group : Icons.person,
            color: Colors.white,
          ),
        ),
        title: Text(
          chatName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          isGroup ? '$memberCount members' : 'Direct message',
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _formatDate(createdAt),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        onTap: () {
          _openChatDetail(chat);
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  void _showUserInfo(BuildContext context) {
    final userAuth = AuthSession().userAuthModel;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('User Info'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${userAuth?.user.username ?? 'Unknown'}'),
            Text('Email: ${userAuth?.user.email ?? 'Not provided'}'),
            Text('ID: ${userAuth?.user.id ?? 'Unknown'}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _logout() {
    serviceLocator.get<AuthBloc>().add(LogoutEvent());
  }

  void _showCreateChatDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Chat'),
        content: const Text('Chat creation feature coming soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _openChatDetail(Map<String, dynamic> chat) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ChatDetailScreen(chat: chat),
      ),
    );
  }
}
