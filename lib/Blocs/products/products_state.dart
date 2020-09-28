import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';



abstract class ProductsState extends Equatable {
  const ProductsState();
//  CarouselsState([List props = const[]]) : super([props]);
//  @override
 List<Object> get props => [];
}
class ProductsEmpty extends ProductsState {}
/**
 * loading home images
 */
class ProductsLoading extends ProductsState {

}
/**
 * home images slider load completed
 */
class Productsloaded extends ProductsState {
  final List<Product> lstProduct;


  const Productsloaded({@required this.lstProduct}) : assert(lstProduct != null);

  @override
  List<Object> get props => [lstProduct];
}

class ProductsError extends ProductsState {}




