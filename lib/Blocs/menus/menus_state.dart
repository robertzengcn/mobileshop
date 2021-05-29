import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';



abstract class MenusState extends Equatable {
  const MenusState();
//  CarouselsState([List props = const[]]) : super([props]);
//  @override
 List<Object> get props => [];
}
class MenusEmpty extends MenusState {}
/**
 * loading home images
 */
class MenusLoading extends MenusState {

}
/**
 * home images slider load completed
 */
class Menusloaded extends MenusState {
  final List<Menu> lstMenu;


  const Menusloaded({required this.lstMenu}) : assert(lstMenu != null);

  @override
  List<Object> get props => [lstMenu];
}

class MenusError extends MenusState {}




