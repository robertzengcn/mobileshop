part of 'wishs_bloc.dart';

abstract class WishsEvent extends Equatable {
  const WishsEvent();
}

///add product to wish list
class AddWishsEvent extends WishsEvent {
  final int product_id;

  const AddWishsEvent({required this.product_id});

  @override
  List<Object> get props => [product_id];
}
///check whether the product in wish
class CheckWishsEvent extends WishsEvent {
  final int product_id;

  const CheckWishsEvent({required this.product_id});

  @override
  List<Object> get props => [product_id];
}