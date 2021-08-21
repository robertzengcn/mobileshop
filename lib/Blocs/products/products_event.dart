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
class ProductAddToCartEvent extends ProductsEvent {}
