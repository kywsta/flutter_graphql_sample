import 'dart:async';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../core/network/graphql_service.dart';
import '../utils/datetime_utils.dart';

class EnhancedSubscriptionTestScreen extends StatefulWidget {
  final String chatId;
  final String chatName;

  const EnhancedSubscriptionTestScreen({
    super.key,
    required this.chatId,
    required this.chatName,
  });

  @override
  State<EnhancedSubscriptionTestScreen> createState() => _EnhancedSubscriptionTestScreenState();
}

class _EnhancedSubscriptionTestScreenState extends State<EnhancedSubscriptionTestScreen> {
  final List<Map<String, dynamic>> _subscriptionMessages = [];
  final List<Map<String, dynamic>> _typingEvents = [];
  String _messageConnectionStatus = 'Connecting...';
  String _typingConnectionStatus = 'Connecting...';
  Timer? _typingTimer;

  @override
  void dispose() {
    _typingTimer?.cancel();
    super.dispose();
  }

  Future<void> _sendTypingStatus(bool isTyping) async {
    try {
      final client = GraphQLService().client;
      await client.mutate(
        MutationOptions(
          document: gql(GraphQLService.setTypingStatusMutation),
          variables: {
            'chatId': widget.chatId,
            'isTyping': isTyping,
          },
        ),
      );
      
      setState(() {
        _typingEvents.insert(0, {
          'action': isTyping ? 'Started typing' : 'Stopped typing',
          'timestamp': DateTime.now().toIso8601String(),
          'type': 'sent',
        });
      });
    } catch (e) {
      print('Error setting typing status: $e');
    }
  }

  void _startTypingTest() {
    _sendTypingStatus(true);
    
    // Stop typing after 3 seconds
    _typingTimer?.cancel();
    _typingTimer = Timer(const Duration(seconds: 3), () {
      _sendTypingStatus(false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(GraphQLService().client),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Enhanced Test: ${widget.chatName}'),
          backgroundColor: Colors.purple,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            // Connection status
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.purple[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Subscription Status',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Messages: $_messageConnectionStatus'),
                  Text('Typing: $_typingConnectionStatus'),
                  Text('Chat ID: ${widget.chatId}'),
                ],
              ),
            ),
            
            // Control buttons
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _startTypingTest,
                    icon: const Icon(Icons.keyboard),
                    label: const Text('Test Typing'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _subscriptionMessages.clear();
                        _typingEvents.clear();
                      });
                    },
                    icon: const Icon(Icons.clear),
                    label: const Text('Clear All'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            
            // Dual subscriptions
            Expanded(
              child: Row(
                children: [
                  // Message subscription panel
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(color: Colors.grey[300]!),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            color: Colors.blue[50],
                            child: const Text(
                              'Message Subscription',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
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
                                      _messageConnectionStatus = 'Error: ${result.exception}';
                                    } else if (result.isLoading) {
                                      _messageConnectionStatus = 'Connected - Listening...';
                                    } else {
                                      _messageConnectionStatus = 'Connected - Active';
                                    }
                                  });
                                });

                                // Handle new message from subscription
                                if (result.data != null) {
                                  final newMessage = result.data!['messageAdded'] as Map<String, dynamic>;
                                  
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

                                return _subscriptionMessages.isEmpty
                                    ? const Center(
                                        child: Text(
                                          'Listening for messages...',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      )
                                    : ListView.builder(
                                        itemCount: _subscriptionMessages.length,
                                        itemBuilder: (context, index) {
                                          final message = _subscriptionMessages[index];
                                          return _buildMessageTile(message);
                                        },
                                      );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // Typing subscription panel
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          color: Colors.orange[50],
                          child: const Text(
                            'Typing Subscription',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Subscription(
                            options: SubscriptionOptions(
                              document: gql(GraphQLService.typingIndicatorSubscription),
                              variables: {'chatId': widget.chatId},
                            ),
                            builder: (QueryResult result) {
                              // Update connection status
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                setState(() {
                                  if (result.hasException) {
                                    _typingConnectionStatus = 'Error: ${result.exception}';
                                  } else if (result.isLoading) {
                                    _typingConnectionStatus = 'Connected - Listening...';
                                  } else {
                                    _typingConnectionStatus = 'Connected - Active';
                                  }
                                });
                              });

                              // Handle typing indicator from subscription
                              if (result.data != null) {
                                final typingData = result.data!['typingIndicator'] as Map<String, dynamic>;
                                
                                WidgetsBinding.instance.addPostFrameCallback((_) {
                                  setState(() {
                                    _typingEvents.insert(0, {
                                      ...typingData,
                                      'receivedAt': DateTime.now().toIso8601String(),
                                      'type': 'received',
                                    });
                                  });
                                });
                              }

                              return _typingEvents.isEmpty
                                  ? const Center(
                                      child: Text(
                                        'Listening for typing...',
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: _typingEvents.length,
                                      itemBuilder: (context, index) {
                                        final event = _typingEvents[index];
                                        return _buildTypingEventTile(event);
                                      },
                                    );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                  const Text(
                    'Debug Summary:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('Messages received: ${_subscriptionMessages.length}'),
                  Text('Typing events: ${_typingEvents.length}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageTile(Map<String, dynamic> message) {
    final content = message['content'] as String;
    final userId = message['userId'] as String;
    final createdAt = DateTime.parse(message['createdAt']);
    final receivedAt = DateTime.parse(message['receivedAt']);

    return Card(
      margin: const EdgeInsets.all(4),
      child: ListTile(
        dense: true,
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 16,
          child: Text(
            userId.substring(0, 1).toUpperCase(),
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
        title: Text(
          content,
          style: const TextStyle(fontSize: 14),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User: $userId', style: const TextStyle(fontSize: 10)),
            Text('Sent: ${DateTimeUtils.formatTestTime(createdAt)}', style: const TextStyle(fontSize: 10)),
            Text(
              'Received: ${DateTimeUtils.formatTestTime(receivedAt)}',
              style: const TextStyle(
                fontSize: 10,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypingEventTile(Map<String, dynamic> event) {
    final isReceived = event['type'] == 'received';
    final timestamp = DateTime.parse(event[isReceived ? 'receivedAt' : 'timestamp']);
    
    if (isReceived) {
      final username = event['username'] as String;
      final isTyping = event['isTyping'] as bool;
      
      return Card(
        margin: const EdgeInsets.all(4),
        child: ListTile(
          dense: true,
          leading: Icon(
            isTyping ? Icons.keyboard : Icons.keyboard_hide,
            color: isTyping ? Colors.orange : Colors.grey,
            size: 20,
          ),
          title: Text(
            '$username ${isTyping ? 'started' : 'stopped'} typing',
            style: const TextStyle(fontSize: 14),
          ),
          subtitle: Text(
            'Received: ${DateTimeUtils.formatTestTime(timestamp)}',
            style: const TextStyle(
              fontSize: 10,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    } else {
      final action = event['action'] as String;
      
      return Card(
        margin: const EdgeInsets.all(4),
        child: ListTile(
          dense: true,
          leading: const Icon(
            Icons.send,
            color: Colors.blue,
            size: 20,
          ),
          title: Text(
            action,
            style: const TextStyle(fontSize: 14),
          ),
          subtitle: Text(
            'Sent: ${DateTimeUtils.formatTestTime(timestamp)}',
            style: const TextStyle(
              fontSize: 10,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }
  }


} 