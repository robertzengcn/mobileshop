part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
}

class RegisterInitial extends RegisterState {
  @override
  List<Object> get props => [];
}

class Registerfailure extends RegisterState {
  final String error;

  const Registerfailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Register Failure { error: $error }';
}
///user login success
class RegisterCompleted extends RegisterState {
  const RegisterCompleted();
  @override
  List<Object> get props => [];
}
class RegisterLoadingState extends RegisterState {
  const RegisterLoadingState();
  @override
  List<Object> get props => [];
}
