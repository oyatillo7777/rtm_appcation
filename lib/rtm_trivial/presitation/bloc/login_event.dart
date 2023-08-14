part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class GetFetchEvent extends LoginEvent {}

class GetPostEvent extends LoginEvent {
  final String name;
  final String password;

  GetPostEvent(this.name, this.password);

  @override
  String toString() {
    return 'GetPostEvent{name: $name, password: $password}';
  }
}
