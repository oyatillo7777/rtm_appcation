part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  Loginmodel post;

  LoginSuccessState(this.post);
}

class LoginFailureState extends LoginState {}


class LoginNoConnectionState extends LoginState {}
