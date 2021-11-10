part of 'orders_bloc.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();
}

class OrdersInitial extends OrdersState {
  @override
  List<Object> get props => [];
}

class OrderCreatesuccess extends OrdersState {
  @override
  List<Object> get props => [];
}
/// create order failure
class OrderCreateError extends OrdersState {
  final String error;

  OrderCreateError({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'create error { error: $error }';
}
