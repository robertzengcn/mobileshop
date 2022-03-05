part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}
///register user event
// class RegisterUser extends RegisterEvent {
//   final String fullName;
//   final String email;
//   final String password;
//   const RegisterUser({
//     required this.fullName,
//     required this.email,
//     required this.password,
//   });
//   @override
//   List<Object> get props => [fullName, email,password];
// }

class RegisterBtnclick extends RegisterEvent {
  final String fullName;
  final String email;
  final String password;

  const RegisterBtnclick({
    required this.fullName,
    required this.password,
    required this.email
  });

  @override
  List<Object> get props => [fullName, password,email];

  @override
  String toString() =>
      'Regist Button Pressed { username: $fullName, password: $password ,email:$email}';
}

