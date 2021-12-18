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
  final Object paypalRequest;

  OrderCreatesuccessState({
    required this.payment,
    required this.paypalRequest
  });
  @override
  List<Object> get props => [payment,paypalRequest];
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
/// order created,waiting for customer make payment on paypal
class OrderPaypalwaitingState extends OrdersState {
  final String paypalUrl;
  final String returnUrl;
  final String cancelUrl;
  OrderPaypalwaitingState({required this.paypalUrl,required this.returnUrl,required this.cancelUrl});
  @override
  List<Object> get props => [];
}
