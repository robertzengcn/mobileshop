part of 'wishs_bloc.dart';

abstract class WishsState extends Equatable {
  const WishsState();
}

class WishsInitial extends WishsState {
  @override
  List<Object> get props => [];
}

class WishAddsuccessState extends WishsState {
  int wishQuantity;
  WishAddsuccessState({required this.wishQuantity});
  @override
  List<Object> get props => [wishQuantity];
}

class WishErrorState extends WishsState {
  final String error;

  WishErrorState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Add Wish Failure { error: $error }';
}
///check whether product in wish success
class WishChecksuccessState extends WishsState {
  bool inWishlist;
  WishChecksuccessState({required this.inWishlist});
  @override
  List<Object> get props => [inWishlist];
}
