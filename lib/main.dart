import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'core/services/auth_service.dart';
import 'screens/login_screen.dart';
import 'screens/chats_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize GraphQL store
  await initHiveForFlutter();
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GraphQL Chat Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const AuthWrapper(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/chats': (context) => const ChatsScreen(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if user is already authenticated
    if (AuthService().isAuthenticated) {
      return const ChatsScreen();
    } else {
      return const LoginScreen();
    }
  }
}
