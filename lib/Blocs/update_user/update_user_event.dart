part of 'update_user_bloc.dart';

abstract class UpdateUserEvent extends Equatable {
  const UpdateUserEvent();
}

///update user info event
class updateinfoevent extends UpdateUserEvent {
  final String telephone;
  final String name;
  const updateinfoevent({required this.telephone,required this.name});

  @override
  List<Object> get props => [];
}
