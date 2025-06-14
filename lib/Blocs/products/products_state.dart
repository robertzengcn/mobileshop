// import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';



abstract class ProductsState extends Equatable {
  const ProductsState();
//  CarouselsState([List props = const[]]) : super([props]);
//  @override
 List<Object> get props => [];
}
class ProductsInitState extends ProductsState {}

class ProductsEmptyState extends ProductsState {}

///loading product
class ProductsLoadingState extends ProductsState {

}

///rand product loaded success
class RandProductsLoadedState extends ProductsState {
  final List<Product?> loadproduct;
  RandProductsLoadedState({
    required this.loadproduct,
  });
  @override
  List<Object> get props => [loadproduct];
}


class ProductsloadedState extends ProductsState {
  final Product product;


  const ProductsloadedState({required this.product});

  @override
  List<Object> get props => [product];
}

class ProductsErrorState extends ProductsState {
  final String error;
  const ProductsErrorState({required this.error});
  @override
  List<Object> get props => [error];
}

class ProductlistloadedState extends ProductsState {
  final List<Product> lproduct;


  const ProductlistloadedState({required this.lproduct});

  @override
  List<Object> get props => [lproduct];
}




