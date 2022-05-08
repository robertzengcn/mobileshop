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
  final bool gotocart;

  AddToCartEvent({
    required this.productId,
    required this.quantity,
    this.args,
    required this.gotocart
  });
}

@immutable
class queryCartquantityEvent extends CartsEvent {
}
@immutable
class queryCartcontentEvent extends CartsEvent {

}

@immutable
class updateCartquantityEvent extends CartsEvent {
  String cartId;
  int quantity;//数量
  updateCartquantityEvent({
    required this.cartId,
    required this.quantity
  });
}

@immutable
class deleteCartEvent extends CartsEvent {
  String cartId;

  deleteCartEvent({
    required this.cartId
  });
}