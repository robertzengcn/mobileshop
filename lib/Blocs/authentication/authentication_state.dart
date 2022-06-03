part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationUninitialized extends AuthenticationState {

}

class AuthenticationAuthenticated extends AuthenticationState {
  final String token;
  final String name;

  const AuthenticationAuthenticated({required this.token,required this.name});
  @override
  List<Object> get props => [token];
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {

}
