import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../core/graphql/graphql_service.dart';
import '../utils/datetime_utils.dart';

class SubscriptionTestScreen extends StatefulWidget {
  final String chatId;
  final String chatName;

  const SubscriptionTestScreen({
    super.key,
    required this.chatId,
    required this.chatName,
  });

  @override
  State<SubscriptionTestScreen> createState() => _SubscriptionTestScreenState();
}

class _SubscriptionTestScreenState extends State<SubscriptionTestScreen> {
  final List<Map<String, dynamic>> _subscriptionMessages = [];
  String _connectionStatus = 'Connecting...';

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(GraphQLService().client),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Subscription Test: ${widget.chatName}'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            // Connection status
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.green[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Connection Status: $_connectionStatus',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('Chat ID: ${widget.chatId}'),
                  Text('Listening for: messageAdded'),
                ],
              ),
            ),
            
            // Subscription widget
            Expanded(
              child: Subscription(
                options: SubscriptionOptions(
                  document: gql(GraphQLService.messageAddedSubscription),
                  variables: {'chatId': widget.chatId},
                ),
                builder: (QueryResult result) {
                  // Update connection status
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    setState(() {
                      if (result.hasException) {
                        _connectionStatus = 'Error: ${result.exception}';
                      } else if (result.isLoading) {
                        _connectionStatus = 'Connected - Listening...';
                      } else {
                        _connectionStatus = 'Connected - Active';
                      }
                    });
                  });

                  // Handle new message from subscription
                  if (result.data != null) {
                    final newMessage = result.data!['messageAdded'] as Map<String, dynamic>;
                    
                    // Add to subscription messages list (avoid duplicates)
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        final exists = _subscriptionMessages.any((m) => m['id'] == newMessage['id']);
                        if (!exists) {
                          _subscriptionMessages.insert(0, {
                            ...newMessage,
                            'receivedAt': DateTime.now().toIso8601String(),
                          });
                        }
                      });
                    });
                  }

                  return Column(
                    children: [
                      // Subscription messages list
                      Expanded(
                        child: _subscriptionMessages.isEmpty
                            ? const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.hearing,
                                      size: 64,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'Listening for new messages...',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Send a message from another client to test',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: _subscriptionMessages.length,
                                itemBuilder: (context, index) {
                                  final message = _subscriptionMessages[index];
                                  return _buildSubscriptionMessageTile(message);
                                },
                              ),
                      ),
                      
                      // Debug info
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        color: Colors.grey[100],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Debug Info:',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('Messages received: ${_subscriptionMessages.length}'),
                            Text('Has exception: ${result.hasException}'),
                            Text('Is loading: ${result.isLoading}'),
                            if (result.hasException)
                              Text(
                                'Exception: ${result.exception}',
                                style: const TextStyle(color: Colors.red),
                              ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _subscriptionMessages.clear();
            });
          },
          backgroundColor: Colors.green,
          tooltip: 'Clear messages',
          child: const Icon(Icons.clear, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSubscriptionMessageTile(Map<String, dynamic> message) {
    final content = message['content'] as String;
    final userId = message['userId'] as String;
    final createdAt = DateTime.parse(message['createdAt']);
    final receivedAt = DateTime.parse(message['receivedAt']);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: Text(
            userId.substring(0, 1).toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(content),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('From user: $userId'),
                            Text('Sent: ${DateTimeUtils.formatTestTime(createdAt)}'),
                Text(
                  'Received: ${DateTimeUtils.formatTestTime(receivedAt)}',
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing: Icon(
          Icons.flash_on,
          color: Colors.green[600],
        ),
      ),
    );
  }


} 