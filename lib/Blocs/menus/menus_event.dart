import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class MenusEvent extends Equatable {
  const MenusEvent();

  @override
  List<Object> get props => [];
}

class FetchMenus extends MenusEvent {


  const FetchMenus();

  @override
  List<Object> get props => [];
}

//class ImagesliderUpdated extends CarouselsEvent {
//  final List<Imageslider> imageslider;
//
//  const ImagesliderUpdated(this.imageslider);
//
//  @override
//  List<Object> get props => [imageslider];
//}
class LoadingMenus extends MenusEvent {}

class LoadedMenus  extends MenusEvent {}