import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_graphql_sample/core/auth/bloc/auth_bloc.dart';
import 'package:flutter_graphql_sample/core/di/service_injector.dart';
import 'package:flutter_graphql_sample/core/di/service_locator.dart';
import 'package:flutter_graphql_sample/core/navigation/app_router.dart';
import 'package:flutter_graphql_sample/features/chat/presentation/cubit/selected_chat_cubit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize GraphQL store
  await initHiveForFlutter();

  await dotenv.load(fileName: ".env");

  initServiceLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => serviceLocator.get<AuthBloc>()),
        BlocProvider(create: (context) => serviceLocator.get<SelectedChatCubit>()),
      ],
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: serviceLocator.get<AppRouter>().router,
      title: 'Flappy Chat',
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
