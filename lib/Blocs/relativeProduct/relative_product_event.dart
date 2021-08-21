part of 'relative_product_bloc.dart';

abstract class RelativeProductEvent extends Equatable {
  const RelativeProductEvent();
}

class FetchRelativeProductEvent extends RelativeProductEvent {

  final int productId;
  const FetchRelativeProductEvent({
    required this.productId,
  });

  @override
  List<Object> get props => [productId];
}
