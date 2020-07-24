import 'package:equatable/equatable.dart';
import 'package:firebase_repository/firebase_repository.dart';

abstract class ImagesEvent extends Equatable {
  const ImagesEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ImagesEvent {}

class ProductsUpdated extends ImagesEvent {
  final List<Product> products;

  const ProductsUpdated(this.products);

  @override
  List<Object> get props => [products];
}