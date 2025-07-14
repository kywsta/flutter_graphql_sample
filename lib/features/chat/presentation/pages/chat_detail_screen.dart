import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_sample/core/auth/auth_session.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/get_chat_messages.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/get_chats.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/presentation/bloc/chat_detail_bloc.dart';
import 'package:flutter_graphql_sample/features/chat/presentation/cubit/selected_chat_cubit.dart';
import 'package:flutter_graphql_sample/utils/datetime_utils.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_loadMoreListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final chat = context.watch<SelectedChatCubit>().state;

      if (chat == null) {
        return _buildChatNotSelectedView();
      }

      return Scaffold(
        appBar: _buildAppBar(chat),
        body: _buildBody(),
      );
    });
  }

  Widget _buildChatNotSelectedView() {
    return const Center(child: Text('Chat not selected'));
  }

  AppBar _buildAppBar(Query$GetChats$getChats$edges$node chat) {
    final theme = Theme.of(context);

    return AppBar(
      leading: CloseButton(
        onPressed: _closeChat,
      ),
      title: (chat.isGroup)
          ? Column(
              children: [
                Text(
                  chat.name,
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  "${chat.memberIds.length} members",
                  style: theme.textTheme.bodySmall,
                ),
              ],
            )
          : Text(chat.name),
    );
  }

  Widget _buildBody() {
    return Column(children: [
      _buildMessageArea(),
      _buildMessageInput(),
    ]);
  }

  Widget _buildMessageArea() {
    return Expanded(
      child: Builder(builder: (context) {
        final status =
            context.select((ChatDetailBloc bloc) => bloc.state.status);

        if (status == ChatDetailStatus.initial) {
          return _buildLoadingIndicator();
        }

        final messages =
            context.select((ChatDetailBloc bloc) => bloc.state.messages);
        final hasReachedMax =
            context.select((ChatDetailBloc bloc) => bloc.state.hasReachedMax);

        return (messages.isEmpty)
            ? _buildEmptyMessagesView()
            : _buildMessagesList(messages, hasReachedMax);
      }),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildEmptyMessagesView() {
    return const Center(
        child: Column(
      children: [
        Icon(Icons.chat_bubble_outline),
        Text('No messages yet'),
      ],
    ));
  }

  Widget _buildMessagesList(
      List<Query$GetChatMessages$getChatMessages$edges$node> messages,
      bool hasReachedMax) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: hasReachedMax ? messages.length : messages.length + 1,
      reverse: true,
      itemBuilder: (context, index) {
        if (index < messages.length) {
          final message = messages[index];
          return _buildMessageBubble(message);
        } else {
          return _buildLoadingMoreIndicator();
        }
      },
    );
  }

  Widget _buildLoadingMoreIndicator() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: SizedBox.square(
          dimension: 24,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _buildMessageBubble(
      Query$GetChatMessages$getChatMessages$edges$node message) {
    final theme = Theme.of(context);

    final currentUserId = AuthSession().userId;
    final isMyMessage = message.userId == currentUserId;
    final content = message.content;
    final createdAt = message.createdAt;

    return Align(
      alignment: isMyMessage ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isMyMessage
              ? theme.colorScheme.secondaryContainer
              : theme.colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              style: TextStyle(
                color: isMyMessage
                    ? theme.colorScheme.onSecondaryContainer
                    : theme.colorScheme.onSurface,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              DateTimeUtils.formatMessageTime(createdAt),
              style: TextStyle(
                color: isMyMessage
                    ? theme.colorScheme.onSecondaryContainer
                    : theme.colorScheme.onSurface,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
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
    return Builder(builder: (context) {
      final isSendingMessage =
          context.select((ChatDetailBloc bloc) => bloc.state.sendingMessage);

      return Row(
        children: [
          _buildTextInput(isSendingMessage),
          const SizedBox(width: 8),
          _buildSendButton(isSendingMessage),
        ],
      );
    });
  }

  Widget _buildTextInput(bool isSendingMessage) {
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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        maxLines: null,
        textCapitalization: TextCapitalization.sentences,
        enabled: !isSendingMessage,
        onChanged: _onTextChanged,
        onSubmitted: (_) => _sendMessage(),
      ),
    );
  }

  Widget _buildSendButton(bool isSendingMessage) {
    final theme = Theme.of(context);

    return CircleAvatar(
      backgroundColor: theme.colorScheme.primaryContainer,
      child: IconButton(
        icon: isSendingMessage
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Icon(
                Icons.send,
                size: 20,
                color: theme.colorScheme.onPrimaryContainer,
              ),
        onPressed: isSendingMessage ? null : _sendMessage,
      ),
    );
  }

  void _closeChat() {
    Navigator.pop(context);
  }

  void _loadMoreListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      if (!context.read<ChatDetailBloc>().state.hasReachedMax) {
        context.read<ChatDetailBloc>().add(GetChatMessages());
      }
    }
  }

  void _onTextChanged(String text) {}

  void _sendMessage() {}
}
