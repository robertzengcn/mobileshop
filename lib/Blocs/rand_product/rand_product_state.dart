part of 'rand_product_bloc.dart';

abstract class RandProductState extends Equatable {
  const RandProductState();
}

class RandProductInitial extends RandProductState {
  @override
  List<Object> get props => [];
}

///loading product
class RandProductsLoadingState extends RandProductState {
  @override
  List<Object> get props => [];
}

///product loaded success
class RandProductsLoadedState extends RandProductState {
  List<Product?> loadproduct;
  RandProductsLoadedState({
    required this.loadproduct,
  });
  @override
  List<Object> get props => [loadproduct];
}

///loading product
class RandProductsErrorState extends RandProductState {
  @override
  List<Object> get props => [];
}
