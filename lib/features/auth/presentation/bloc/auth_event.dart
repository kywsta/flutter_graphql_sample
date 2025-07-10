part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final LoginModel loginModel;

  const LoginEvent({required this.loginModel});

  @override
  List<Object> get props => [loginModel];
}

class RegisterEvent extends AuthEvent {
  final RegisterModel registerModel;

  const RegisterEvent({required this.registerModel});

  @override
  List<Object> get props => [registerModel];
}

class LogoutEvent extends AuthEvent {}