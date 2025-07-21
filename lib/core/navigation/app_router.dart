import 'package:flutter/widgets.dart';
import 'package:flutter_graphql_sample/core/auth/bloc/auth_bloc.dart';
import 'package:flutter_graphql_sample/core/navigation/router_refresh_listenable.dart';
import 'package:flutter_graphql_sample/features/auth/routes.dart';
import 'package:flutter_graphql_sample/features/chat/routes.dart';
import 'package:go_router/go_router.dart';

class AppNavigatorKey {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext get context => navigatorKey.currentContext!;
}

class AppRouter {
  final GoRouter router;

  AppRouter(AuthBloc authBloc)
      : router = GoRouter(
          navigatorKey: AppNavigatorKey.navigatorKey,
          routes: [
            ...AuthRoutes.routes,
            ...ChatRoutes.routes,
          ],
          redirect: (context, state) {
            // final isAuthenticated = AuthSession().isAuthenticated;
            final authState = authBloc.state;
            final isAuthenticated = authState is Authenticated;

            if (!isAuthenticated) {
              debugPrint("Not authenticated, redirecting to login");
              return AuthRoutes.login;
            }

            if (state.matchedLocation == AuthRoutes.login && isAuthenticated) {
              debugPrint("Login success, redirecting to chats");
              return ChatRoutes.chats;
            }

            return null;
          },
          refreshListenable: RouterRefreshListenable(authBloc.stream),
        );
}
