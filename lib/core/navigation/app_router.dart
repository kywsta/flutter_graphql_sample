import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_sample/core/auth/auth_session.dart';
import 'package:flutter_graphql_sample/core/di/service_locator.dart';
import 'package:flutter_graphql_sample/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter_graphql_sample/features/chat/domain/use_cases/get_chats_use_case.dart';
import 'package:flutter_graphql_sample/features/chat/presentation/bloc/chat_list_bloc.dart';
import 'package:flutter_graphql_sample/features/chat/presentation/pages/chats_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {}

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => BlocProvider(
        create: (context) => ChatListBloc(
          getChatsUseCase: serviceLocator.get<GetChatsUseCase>(),
        )..add(GetChatsEvent()),
        child: const ChatsScreen(),
      ),
    ),
  ],
  redirect: (context, state) {
    final isAuthenticated = AuthSession().isAuthenticated;

    if (!isAuthenticated) {
      debugPrint("Not authenticated, redirecting to login");
      return '/login';
    }

    if (state.matchedLocation == '/login' && isAuthenticated) {
      debugPrint("Login success, redirecting to chats");
      return '/';
    }

    return null;
  },
  refreshListenable: AuthSession(),
);
