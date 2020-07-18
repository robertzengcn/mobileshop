import 'package:equatable/equatable.dart';
import 'package:products_repository/products_repository.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductsEvent {}

class ProductsUpdated extends ProductsEvent {
  final List<Product> products;

  const ProductsUpdated(this.products);

  @override
  List<Object> get props => [products];
}