import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_sample/core/auth/auth_session.dart';
import 'package:flutter_graphql_sample/features/auth/routes.dart';
import 'package:flutter_graphql_sample/features/chat/presentation/routes.dart';
import 'package:go_router/go_router.dart';

class AppNavigatorKey {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
}

class AppRouter {
  static final AppRouter _instance = AppRouter._();

  AppRouter._();

  factory AppRouter() => _instance;

  

  final router = GoRouter(
    navigatorKey: AppNavigatorKey.navigatorKey,
    routes: [
      ...AuthRoutes.routes,
      ...ChatRoutes.routes,
    ],
    redirect: (context, state) {
      final isAuthenticated = AuthSession().isAuthenticated;

      if (!isAuthenticated) {
        debugPrint("Not authenticated, redirecting to login");
        return AuthRoutes.login;
      }

      if (state.matchedLocation == '/login' && isAuthenticated) {
        debugPrint("Login success, redirecting to chats");
        return ChatRoutes.chats;
      }

      return null;
    },
    refreshListenable: AuthSession(),
  );
}
