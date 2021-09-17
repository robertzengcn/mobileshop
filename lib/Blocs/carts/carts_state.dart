part of 'carts_bloc.dart';

@immutable
abstract class CartsState extends Equatable {
 int cartQuantity=0;
  List<Object> get props => [];

}

class CartsInitialState extends CartsState {}

class CartsAddsuccessState extends CartsState {
  int cartQuantity;
  CartsAddsuccessState({required this.cartQuantity});
}

class CartsErrorState extends CartsState {
  final String error;

  CartsErrorState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}
class CartsQuantitygetsuccessState extends CartsState {
  int cartQuantity;
  CartsQuantitygetsuccessState({required this.cartQuantity});
}

class CartlistsuccessState extends CartsState {
  List<Cart> cartList;
  CartlistsuccessState({required this.cartList});
}
