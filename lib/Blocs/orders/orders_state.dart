part of 'orders_bloc.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();
}

class OrdersInitial extends OrdersState {
  @override
  List<Object> get props => [];
}

class OrderCreatesuccessState extends OrdersState {
  final String payment;

  final Invoice invoice;
  OrderCreatesuccessState({
    required this.payment,
    required this.invoice
  });
  @override
  List<Object> get props => [payment,invoice];
}
/// create order failure
class OrderErrorState extends OrdersState {
  final String error;

  OrderErrorState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'create error { error: $error }';
}
/// create order failure
class OrderPenddingState extends OrdersState {
  OrderPenddingState();
  @override
  List<Object> get props => [];
}
