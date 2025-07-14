import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_sample/core/di/service_locator.dart';
import 'package:flutter_graphql_sample/core/navigation/app_router.dart';
import 'package:flutter_graphql_sample/features/chat/domain/graphql/get_chats.graphql.dart';
import 'package:flutter_graphql_sample/features/chat/domain/use_cases/get_chat_messages_use_case.dart';
import 'package:flutter_graphql_sample/features/chat/domain/use_cases/get_chats_use_case.dart';
import 'package:flutter_graphql_sample/features/chat/presentation/bloc/chat_detail_bloc.dart';
import 'package:flutter_graphql_sample/features/chat/presentation/bloc/chat_list_bloc.dart';
import 'package:flutter_graphql_sample/features/chat/presentation/cubit/selected_chat_cubit.dart';
import 'package:flutter_graphql_sample/features/chat/presentation/pages/chat_detail_screen.dart';
import 'package:flutter_graphql_sample/features/chat/presentation/pages/chats_screen.dart';
import 'package:go_router/go_router.dart';

class ChatRoutes {
  static const String chats = '/';
  static const String chatDetail = '/chat/:chatId';

  static final routes = [
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => ChatListBloc(
          getChatsUseCase: serviceLocator.get<GetChatsUseCase>(),
        )..add(GetChatsEvent()),
        child: const ChatsScreen(),
      ),
    ),
    GoRoute(
      path: '/chat/:chatId',
      builder: (context, state) => BlocProvider(
        key: ValueKey(state.pathParameters['chatId']),
        create: (context) => ChatDetailBloc(
          chat: context.read<SelectedChatCubit>().state!,
          getChatMessagesUseCase: serviceLocator.get<GetChatMessagesUseCase>(),
        )..add(GetChatMessages()),
        child: const ChatDetailScreen(),
      ),
    )
  ];

  static void navigateToChats() {
    AppRouter().router.go('/');
  }

  static void navigateToChatDetail(Query$GetChats$getChats$edges$node chat) {
    AppNavigatorKey.context.read<SelectedChatCubit>().setSelectedChat(chat);
    AppRouter().router.push('/chat/${chat.id}');
  }
}
