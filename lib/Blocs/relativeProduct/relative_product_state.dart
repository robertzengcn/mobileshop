part of 'relative_product_bloc.dart';

abstract class RelativeProductState extends Equatable {
  const RelativeProductState();
}

class RelativeProductInitialState extends RelativeProductState {
  @override
  List<Object> get props => [];
}
class RelativeProductloadedState extends RelativeProductState {
  final List<Product> lstRelative;


  const RelativeProductloadedState({required this.lstRelative});

  @override
  List<Object> get props => [lstRelative];
}
///loading home images
class RelativeProductloading extends RelativeProductState {
  @override
  List<Object> get props => [];
}
