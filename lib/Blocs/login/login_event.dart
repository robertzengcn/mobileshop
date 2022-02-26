part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}
class LoginUsernameChanged extends LoginEvent {
  const LoginUsernameChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}
class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';
}
class LoginSubmitted extends LoginEvent {
  const LoginSubmitted();
}
class LoginSuccessed extends LoginEvent {

}

class LoginFbsuccess extends LoginEvent {
  final String username;
  final String email;
  final String accessToken;
  final String userId;
  const LoginFbsuccess({
    required this.username,
    required this.email,
    required this.accessToken,
    required this.userId
  });

  @override
  List<Object> get props => [username];

  @override
  String toString() =>
      'LoginFbsuccess { username: $username}';
}