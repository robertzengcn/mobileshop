// import 'package:flutter_html/shims/dart_ui.dart';
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

  const FetchProducttypeEvent({required this.type});

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
///open product detail page
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

@immutable
class ScreenLoadedrandEvent extends ProductsEvent {
  final int randnum;

  ScreenLoadedrandEvent({
    required this.randnum,
  });
  @override
  List<Object> get props => [randnum];
}
