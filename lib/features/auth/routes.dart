import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_sample/core/auth/use_cases/login_use_case.dart';
import 'package:flutter_graphql_sample/core/di/service_locator.dart';
import 'package:flutter_graphql_sample/core/navigation/app_router.dart';
import 'package:flutter_graphql_sample/features/auth/presentation/bloc/login_bloc.dart';
import 'package:flutter_graphql_sample/features/auth/presentation/pages/login_screen.dart';
import 'package:go_router/go_router.dart';

class AuthRoutes {
  static const String login = '/login';

  static final routes = [
    GoRoute(
      path: login,
      builder: (context, state) => BlocProvider(
        create: (context) =>
            LoginBloc(loginUseCase: serviceLocator.get<LoginUseCase>()),
        child: const LoginScreen(),
      ),
    )
  ];
}

extension AuthRoutesExtension on AppRouter {
  void navigateToLogin() {
    router.go(AuthRoutes.login);
  }
}
