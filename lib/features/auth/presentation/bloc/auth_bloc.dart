import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_graphql_sample/core/auth/auth_session.dart';
import 'package:flutter_graphql_sample/core/error/failures.dart';
import 'package:flutter_graphql_sample/features/auth/domain/models/login_model.dart';
import 'package:flutter_graphql_sample/features/auth/domain/models/register_model.dart';
import 'package:flutter_graphql_sample/core/auth/models/user_auth_model.dart';
import 'package:flutter_graphql_sample/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_graphql_sample/features/auth/domain/use_cases/register_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({required this.loginUseCase, required this.registerUseCase})
      : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
    on<RegisterEvent>(_onRegisterEvent);
    on<LogoutEvent>(_onLogoutEvent);
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await loginUseCase.call(event.loginModel);
    result.fold(
      (userAuthModel) {
        AuthSession().setAuthSession(userAuthModel);
        emit(Authenticated(userAuthModel: userAuthModel));
      },
      (failure) => emit(AuthFailure(failure: failure)),
    );
  }

  Future<void> _onRegisterEvent(
      RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await registerUseCase.call(event.registerModel);
    result.fold(
      (userAuthModel) {
        AuthSession().setAuthSession(userAuthModel);
        emit(Authenticated(userAuthModel: userAuthModel));
      },
      (failure) => emit(AuthFailure(failure: failure)),
    );
  }

  Future<void> _onLogoutEvent(
      LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    AuthSession().clearAuthSession();
    emit(AuthInitial());
  }
}
