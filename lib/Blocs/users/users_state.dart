part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
}

class UsersInitial extends UsersState {
  @override
  List<Object> get props => [];
}

class loadingUserinfostate extends UsersState {

  const loadingUserinfostate();

  @override
  List<Object> get props => [];
}
class queryUserinfosuccessstate extends UsersState {
  final UserInfo userinfo;
  const queryUserinfosuccessstate({required this.userinfo});

  @override
  List<Object> get props => [userinfo];
}
