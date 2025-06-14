part of 'update_user_bloc.dart';

abstract class UpdateUserEvent extends Equatable {
  const UpdateUserEvent();
}

///update user info event
class Updateinfoevent extends UpdateUserEvent {
  final String telephone;
  final String name;
  const Updateinfoevent({required this.telephone,required this.name});

  @override
  List<Object> get props => [];
}
///update user info event
class DeleteUserevent extends UpdateUserEvent {
  const DeleteUserevent();
  @override
  List<Object> get props => [];
}