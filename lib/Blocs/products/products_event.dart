import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductsEvent {


  const FetchProducts();

  @override
  List<Object> get props => [];
}

class FetchProducttype extends ProductsEvent {
  final String type;

  const FetchProducttype({@required this.type}) : assert(type != null);

  @override
  List<Object> get props => [type];
}

//class ImagesliderUpdated extends CarouselsEvent {
//  final List<Imageslider> imageslider;
//
//  const ImagesliderUpdated(this.imageslider);
//
//  @override
//  List<Object> get props => [imageslider];
//}
class LoadingMenus extends ProductsEvent {}

class LoadedMenus  extends ProductsEvent {}