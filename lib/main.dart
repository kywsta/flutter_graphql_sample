import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_subscription_test/core/auth/auth_session.dart';
import 'package:flutter_graphql_subscription_test/core/di/service_injector.dart';
import 'package:flutter_graphql_subscription_test/core/di/service_locator.dart';
import 'package:flutter_graphql_subscription_test/core/navigation/app_router.dart';
import 'package:flutter_graphql_subscription_test/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GraphQL store
  await initHiveForFlutter();

  initServiceLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator<AuthBloc>()),
      ],
      child: ListenableBuilder(
        listenable: AuthSession(),
        builder: (BuildContext context, Widget? child) {
          return AppView();
        },
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'GraphQL Chat Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      builder: (context, child) {
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
