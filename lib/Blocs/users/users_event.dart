part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();
}
class getUserinfoevent extends UsersEvent {

  const getUserinfoevent();

  @override
  List<Object> get props => [];
}


