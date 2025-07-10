part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class Authenticated extends AuthState {
  final UserAuthModel userAuthModel;

  const Authenticated({required this.userAuthModel});

  @override
  List<Object> get props => [userAuthModel];
}

class SessionExpired extends AuthState {
  final UserAuthModel userAuthModel;

  const SessionExpired({required this.userAuthModel});

  @override
  List<Object> get props => [userAuthModel];
}

class AuthFailure extends AuthState {
  final Failure failure;

  const AuthFailure({required this.failure});

  @override
  List<Object> get props => [failure];
}