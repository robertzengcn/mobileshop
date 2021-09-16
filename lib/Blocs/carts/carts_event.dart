part of 'carts_bloc.dart';

@immutable
abstract class CartsEvent {
  @override
  List<Object> get props => [];
}

@immutable
class AddToCartEvent extends CartsEvent {
  final int productId;
  final int quantity;//数量
  final Map<int, int?>? args;

  AddToCartEvent({
    required this.productId,
    required this.quantity,
    this.args
  });
}

@immutable
class queryCartquantityEvent extends CartsEvent {
}
@immutable
class queryCartcontentEvent extends CartsEvent {

}