import 'package:flutter_html/shims/dart_ui.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';


abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchProductsEvent extends ProductsEvent {

  const FetchProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchProducttypeEvent extends ProductsEvent {
  final String type;

  const FetchProducttypeEvent({required this.type}) : assert(type != null);

  @override
  List<Object> get props => [type];
}

class FetchProductcatEvent extends ProductsEvent {
  final int cateId;//catelogue id
  final int start;
  final int length;

  const FetchProductcatEvent({required this.cateId,required this.length,required this.start}) ;

  @override
  List<Object> get props => [cateId,start,length];
}
class FetchMoreProductcatEvent extends ProductsEvent {
  final int cateId;//catelogue id
  final int start;
  final int length;

  const FetchMoreProductcatEvent({required this.cateId,required this.length,required this.start}) ;

  @override
  List<Object> get props => [cateId,start,length];
}
///产品详情页面打开
@immutable
class ProductScreenLoadedEvent extends ProductsEvent {
  final int productId;

  ProductScreenLoadedEvent({
    required this.productId,
  });
}


@immutable
class ProductAddToFavoritesEvent extends ProductsEvent { }

@immutable
class ProductRemoveFromFavoritesEvent extends ProductsEvent {}

@immutable
class ProductAddToCartEvent extends ProductsEvent {
  final int productId;
  final int quantity;//数量
  final Map<int, int?>? args;

  ProductAddToCartEvent({
    required this.productId,
    required this.quantity,
    this.args
  });
}
