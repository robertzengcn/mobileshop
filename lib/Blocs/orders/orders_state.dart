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
/// create order pendding
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
  final String orderId;
  OrderPaypalwaitingState({required this.paypalUrl,required this.returnUrl,required this.cancelUrl,required this.orderId});
  @override
  List<Object> get props => [];
}

/// featch order list success
class OrderlistFeatchedState extends OrdersState {
  final List<Order?> orderlst;
  final int totolNum;
  OrderlistFeatchedState({required this.orderlst,required this.totolNum});
  @override
  List<Object> get props => [];
}

/// featch order list success
class OrderdetailFeatchedState extends OrdersState {
  final OrderDetail orderdetail;
  OrderdetailFeatchedState({
    required this.orderdetail});
  @override
  List<Object> get props => [orderdetail];
}