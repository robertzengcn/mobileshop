part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();
}
@immutable
class CreateOrderEvent extends OrdersEvent {
final String payment;
final String? comment;
final String shipping;
final String? currency;
final String? platform;

CreateOrderEvent({
  required this.payment,
  this.comment,
  required this.shipping,
  this.currency,
  this.platform
});
  @override
  List<Object> get props => [payment,shipping];
}

@immutable
class FeatchOrderlistEvent extends OrdersEvent {
  final int start;
  final int length;
  FeatchOrderlistEvent({required this.start,required this.length});

  @override
  List<Object> get props => [];

}
@immutable
class FeatchMoreEvent extends OrdersEvent {
  final int start;
  final int length;
  FeatchMoreEvent({required this.start,required this.length});

  @override
  List<Object> get props => [start,length];

}

@immutable
class FeatchOrderDetailEvent extends OrdersEvent {
  final int orderId;
  FeatchOrderDetailEvent({required this.orderId});

  @override
  List<Object> get props => [orderId];

}
