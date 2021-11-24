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

CreateOrderEvent({
  required this.payment,
  this.comment,
  required this.shipping,
  this.currency
});
  @override
  List<Object> get props => [payment,shipping];
}
