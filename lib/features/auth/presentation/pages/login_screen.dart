import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_sample/features/auth/presentation/bloc/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFail) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure.interpretation.message),
            ),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildLoginForm(),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat,
            size: 80,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(height: 32),
          _buildCredentialInputs(),
          const SizedBox(height: 24),
          _buildLoginButton(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildCredentialInputs() {
    return Builder(builder: (context) {
      final isLoading =
          context.select<LoginBloc, bool>((bloc) => bloc.state is LoginLoading);

      return Column(
        children: [
          TextFormField(
            controller: _usernameController,
            decoration: const InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
            enabled: !isLoading,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            enabled: !isLoading,
            onFieldSubmitted: (_) => _login(),
          )
        ],
      );
    });
  }

  Widget _buildLoginButton() {
    return Builder(builder: (context) {
      final isLoading =
          context.select<LoginBloc, bool>((bloc) => bloc.state is LoginLoading);

      return SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: isLoading ? null : _login,
          child: isLoading
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.onPrimary),
                )
              : const Text(
                  'Login',
                  style: TextStyle(fontSize: 16),
                ),
        ),
      );
    });
  }

  void _login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    context.read<LoginBloc>().add(LoginRequested(
          userName: _usernameController.text,
          password: _passwordController.text,
        ));
  }
}
