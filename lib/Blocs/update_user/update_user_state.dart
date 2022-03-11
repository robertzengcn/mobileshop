part of 'update_user_bloc.dart';

abstract class UpdateUserState extends Equatable {
  const UpdateUserState();
}

class UpdateUserInitial extends UpdateUserState {
  @override
  List<Object> get props => [];
}
class UpdateUsersuccessstate extends UpdateUserState {
  @override
  List<Object> get props => [];
}
class UpdateUserErrorState extends UpdateUserState {
  final String error;

  UpdateUserErrorState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'query cart error { error: $error }';
}
