
part of 'authentication_bloc.dart';


abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
//  final String token;
  final User user;
  const LoggedIn({required this.user});

  @override
  List<Object> get props => [user];

//  @override
//  String toString() => 'LoggedIn { token: $token }';
}

class LoggedOut extends AuthenticationEvent {
  // final String token;
  const LoggedOut();
  @override
  List<Object> get props => [];

}

class UpdateAuthnameEvent extends AuthenticationEvent {
  final String name;
  const UpdateAuthnameEvent({required this.name});
  @override
  List<Object> get props => [name];

}

