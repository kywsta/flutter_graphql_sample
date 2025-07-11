import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_sample/core/auth/auth_session.dart';
import 'package:flutter_graphql_sample/features/auth/presentation/pages/login_screen.dart';
import 'package:flutter_graphql_sample/screens/chats_screen.dart';
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
      builder: (context, state) => const ChatsScreen(),
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
