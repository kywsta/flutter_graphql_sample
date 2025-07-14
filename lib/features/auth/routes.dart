import 'package:flutter_graphql_sample/features/auth/presentation/pages/login_screen.dart';
import 'package:go_router/go_router.dart';

class AuthRoutes {
  static const String login = '/login';

  static final routes = [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    )
  ];
}
