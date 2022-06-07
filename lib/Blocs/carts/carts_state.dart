part of 'carts_bloc.dart';

@immutable
abstract class CartsState extends Equatable {
 final int cartQuantity=0;
  List<Object> get props => [];

}

class CartsInitialState extends CartsState {}

class CartsAddsuccessState extends CartsState {
  final int cartQuantity;
  CartsAddsuccessState({required this.cartQuantity});
}
class CartsAddfinishState extends CartsState {
  final int cartQuantity;
  CartsAddfinishState({required this.cartQuantity});
}

class CartsErrorState extends CartsState {
  final String error;

  CartsErrorState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'query cart error { error: $error }';
}
class CartsQuantitygetsuccessState extends CartsState {
  final int cartQuantity;
  CartsQuantitygetsuccessState({required this.cartQuantity});
}

class CartlistsuccessState extends CartsState {
  final List<Cart?> cartList;
  final CartTotal? cartTotal;
  final List<ShippingMethod?> shippingMelist;
  final List<Payment?> paymentList;
  final String symbol;
  CartlistsuccessState({
    required this.cartList,
    this.cartTotal,
    required this.shippingMelist,
    required this.paymentList,
    required this.symbol,
  });
}
class CartRefreshingState extends CartsState {
}
