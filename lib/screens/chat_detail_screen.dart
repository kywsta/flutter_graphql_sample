import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_graphql_sample/core/auth/auth_session.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../core/graphql/graphql_service.dart';
import '../utils/datetime_utils.dart';
import 'subscription_test_screen.dart';
import 'enhanced_subscription_test_screen.dart';

class ChatDetailScreen extends StatefulWidget {
  final Map<String, dynamic> chat;

  const ChatDetailScreen({
    super.key,
    required this.chat,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, dynamic>> _messages = [];
  bool _isLoading = false;
  final Map<String, DateTime> _typingUsers = {};
  Timer? _typingTimer;

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _typingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: ValueNotifier(GraphQLService().client),
      child: _buildScaffold(),
    );
  }

  Widget _buildScaffold() {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(widget.chat['name']),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      actions: _buildAppBarActions(),
    );
  }

  List<Widget> _buildAppBarActions() {
    return [
      _buildSubscriptionTestMenu(),
      _buildInfoButton(),
    ];
  }

  Widget _buildSubscriptionTestMenu() {
    return PopupMenuButton<String>(
      onSelected: _handleTestMenuSelection,
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'simple_test',
          child: Row(
            children: [
              Icon(Icons.bug_report, color: Colors.green),
              SizedBox(width: 8),
              Text('Simple Subscription Test'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'enhanced_test',
          child: Row(
            children: [
              Icon(Icons.science, color: Colors.purple),
              SizedBox(width: 8),
              Text('Enhanced Test (Typing)'),
            ],
          ),
        ),
      ],
      icon: const Icon(Icons.bug_report),
      tooltip: 'Subscription Tests',
    );
  }

  Widget _buildInfoButton() {
    return IconButton(
      icon: const Icon(Icons.info_outline),
      onPressed: _showChatInfo,
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildMessagesArea(),
        _buildMessageInput(),
      ],
    );
  }

  Widget _buildMessagesArea() {
    return Expanded(
      child: _buildInitialQuery(),
    );
  }

  Widget _buildInitialQuery() {
    return Query(
      options: QueryOptions(
        document: gql(GraphQLService.getChatMessagesQuery),
        variables: {
          'chatId': widget.chat['id'],
          'limit': 50,
          'offset': 0,
        },
        fetchPolicy: FetchPolicy.cacheAndNetwork,
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        return _handleInitialQueryResult(result, refetch);
      },
    );
  }

  Widget _handleInitialQueryResult(QueryResult result, VoidCallback? refetch) {
    // Handle initial loading
    if (result.isLoading && _messages.isEmpty) {
      return _buildLoadingIndicator();
    }

    // Handle errors
    if (result.hasException && _messages.isEmpty) {
      return _buildErrorState(result.exception.toString(), refetch);
    }

    // Load initial messages
    if (result.data != null && _messages.isEmpty) {
      final messages = result.data!['getChatMessages'] as List<dynamic>? ?? [];
      _messages = messages.cast<Map<String, dynamic>>();

      // Scroll to bottom after loading messages
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    }

    return _buildSubscriptions();
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorState(String error, VoidCallback? refetch) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text('Error loading messages: $error'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: refetch,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptions() {
    return Subscription(
      options: SubscriptionOptions(
        document: gql(GraphQLService.messageAddedSubscription),
        variables: {'chatId': widget.chat['id']},
      ),
      onSubscriptionResult: _handleMessageSubscriptionResult,
      builder: (QueryResult messageResult) {
        return _buildTypingSubscription();
      },
    );
  }

  Widget _buildTypingSubscription() {
    return Subscription(
      options: SubscriptionOptions(
        document: gql(GraphQLService.typingIndicatorSubscription),
        variables: {'chatId': widget.chat['id']},
      ),
      onSubscriptionResult: _handleTypingSubscriptionResult,
      builder: (QueryResult typingResult) {
        return _buildMessagesWithTyping();
      },
    );
  }

  Widget _buildMessagesWithTyping() {
    return Column(
      children: [
        _buildMessagesList(),
        _buildTypingIndicator(),
      ],
    );
  }

  Widget _buildMessagesList() {
    return Expanded(
      child: _messages.isEmpty
          ? _buildEmptyMessagesState()
          : _buildMessagesListView(),
    );
  }

  Widget _buildEmptyMessagesState() {
    return const Center(
      child: Text(
        'No messages yet.\nSend the first message!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildMessagesListView() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        return _buildMessageBubble(_messages[index]);
      },
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    final currentUserId = AuthSession().userId;
    final isMyMessage = message['userId'].toString() == currentUserId;
    final content = message['content'] as String;
    final createdAt = DateTime.parse(message['createdAt']);

    return Align(
      alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isMyMessage ? Colors.blue[500] : Colors.grey[300],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              style: TextStyle(
                color: isMyMessage ? Colors.white : Colors.black87,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              DateTimeUtils.formatMessageTime(createdAt),
              style: TextStyle(
                color: isMyMessage ? Colors.white70 : Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypingIndicator() {
    if (_typingUsers.isEmpty) return const SizedBox.shrink();

    final typingUsernames = _typingUsers.keys.toList();
    String typingText;

    if (typingUsernames.length == 1) {
      typingText = '${typingUsernames.first} is typing...';
    } else if (typingUsernames.length == 2) {
      typingText =
          '${typingUsernames[0]} and ${typingUsernames[1]} are typing...';
    } else {
      typingText = '${typingUsernames.length} people are typing...';
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            typingText,
            style: TextStyle(
              color: Colors.grey[600],
              fontStyle: FontStyle.italic,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -2),
            blurRadius: 6,
            color: Colors.black.withValues(alpha: 0.1),
          ),
        ],
      ),
      child: SafeArea(
        child: _buildInputRow(),
      ),
    );
  }

  Widget _buildInputRow() {
    return Row(
      children: [
        _buildTextInput(),
        const SizedBox(width: 8),
        _buildSendButton(),
      ],
    );
  }

  Widget _buildTextInput() {
    return Expanded(
      child: TextField(
        controller: _messageController,
        decoration: InputDecoration(
          hintText: 'Type a message...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[100],
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        maxLines: null,
        textCapitalization: TextCapitalization.sentences,
        enabled: !_isLoading,
        onChanged: _onTextChanged,
        onSubmitted: (_) => _sendMessage(),
      ),
    );
  }

  Widget _buildSendButton() {
    return CircleAvatar(
      backgroundColor: Colors.blue,
      child: IconButton(
        icon: _isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : const Icon(Icons.send, color: Colors.white),
        onPressed: _isLoading ? null : _sendMessage,
      ),
    );
  }

  void _handleTestMenuSelection(String value) {
    switch (value) {
      case 'simple_test':
        _navigateToSimpleTest();
        break;
      case 'enhanced_test':
        _navigateToEnhancedTest();
        break;
    }
  }

  void _navigateToSimpleTest() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SubscriptionTestScreen(
          chatId: widget.chat['id'],
          chatName: widget.chat['name'],
        ),
      ),
    );
  }

  void _navigateToEnhancedTest() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EnhancedSubscriptionTestScreen(
          chatId: widget.chat['id'],
          chatName: widget.chat['name'],
        ),
      ),
    );
  }

  void _showChatInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(widget.chat['name']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Chat ID: ${widget.chat['id']}'),
            Text('Creator ID: ${widget.chat['creatorId']}'),
            Text('Members: ${(widget.chat['memberIds'] as List).length}'),
            Text('Is Group: ${widget.chat['isGroup']}'),
            const SizedBox(height: 16),
            const Text('Subscription Features:'),
            Text('✅ Real-time messages enabled'),
            Text('✅ Typing indicators enabled'),
            Text('🔄 Auto-reconnection active'),
            Text('⌨️ Smart typing detection'),
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

  void _handleMessageSubscriptionResult(
      QueryResult subscriptionResult, client) {
    if (subscriptionResult.hasException) {
      print('Message subscription error: ${subscriptionResult.exception}');
    }

    if (subscriptionResult.data != null) {
      final newMessage =
          subscriptionResult.data!['messageAdded'] as Map<String, dynamic>;
      _addMessageToList(newMessage);
    }
  }

  void _addMessageToList(Map<String, dynamic> message) {
    setState(() {
      // Check if message already exists to avoid duplicates
      final existingIndex =
          _messages.indexWhere((m) => m['id'] == message['id']);
      if (existingIndex == -1) {
        _messages.add(message);
        _messages.sort((a, b) => DateTime.parse(a['createdAt'])
            .compareTo(DateTime.parse(b['createdAt'])));
      }
    });

    // Scroll to bottom after adding message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  void _handleTypingSubscriptionResult(QueryResult typingResult, client) {
    if (typingResult.hasException) {
      print('Typing subscription error: ${typingResult.exception}');
    }

    if (typingResult.data != null) {
      final typingData =
          typingResult.data!['typingIndicator'] as Map<String, dynamic>;
      _handleTypingIndicator(typingData);
    }
  }

  void _handleTypingIndicator(Map<String, dynamic> typingData) {
    final userId = typingData['userId'] as String;
    final username = typingData['username'] as String;
    final isTyping = typingData['isTyping'] as bool;
    final currentUserId = AuthSession().userId;

    // Don't show typing indicator for current user
    if (userId == currentUserId) return;

    setState(() {
      if (isTyping) {
        _typingUsers[username] = DateTime.now();
      } else {
        _typingUsers.remove(username);
      }
    });

    // Remove typing indicator after 3 seconds of inactivity
    if (isTyping) {
      Timer(const Duration(seconds: 3), () {
        setState(() {
          final lastUpdate = _typingUsers[username];
          if (lastUpdate != null &&
              DateTime.now().difference(lastUpdate).inSeconds >= 3) {
            _typingUsers.remove(username);
          }
        });
      });
    }
  }

  void _onTextChanged(String text) {
    // Set typing status when user starts typing
    if (text.isNotEmpty) {
      _setTypingStatus(true);

      // Cancel previous timer
      _typingTimer?.cancel();

      // Set timer to stop typing after 2 seconds of inactivity
      _typingTimer = Timer(const Duration(seconds: 2), () {
        _setTypingStatus(false);
      });
    } else {
      _setTypingStatus(false);
      _typingTimer?.cancel();
    }
  }

  Future<void> _setTypingStatus(bool isTyping) async {
    try {
      final client = GraphQLService().client;
      await client.mutate(
        MutationOptions(
          document: gql(GraphQLService.setTypingStatusMutation),
          variables: {
            'chatId': widget.chat['id'],
            'isTyping': isTyping,
          },
        ),
      );
    } catch (e) {
      print('Error setting typing status: $e');
    }
  }

  Future<void> _sendMessage() async {
    final content = _messageController.text.trim();
    if (content.isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final client = GraphQLService().client;
      final result = await client.mutate(
        MutationOptions(
          document: gql(GraphQLService.sendMessageMutation),
          variables: {
            'input': {
              'chatId': widget.chat['id'],
              'content': content,
              'type': 'TEXT',
            }
          },
        ),
      );

      if (result.hasException) {
        if (mounted) {
          _showErrorSnackBar('Error sending message: ${result.exception}');
        }
      } else {
        _messageController.clear();
        // Message will be added via subscription
        _scrollToBottom();
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackBar('Error: $e');
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
