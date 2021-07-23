import 'package:meta/meta.dart';
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

///loading home images

class ProductsLoadingState extends ProductsState {

}



class ProductsloadedState extends ProductsState {
  final Product product;


  const ProductsloadedState({required this.product}) : assert(product != null);

  @override
  List<Object> get props => [product];
}

class ProductsErrorState extends ProductsState {}




