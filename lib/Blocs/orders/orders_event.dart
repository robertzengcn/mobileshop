part of 'orders_bloc.dart';

abstract class OrdersEvent extends Equatable {
  const OrdersEvent();
}
@immutable
class CreateCartEvent extends OrdersEvent {
final String payment;
final String? comment;
final String shipping;
final String? currency;

CreateCartEvent({
  required this.payment,
  this.comment,
  required this.shipping,
  this.currency
});
  @override
  List<Object> get props => [payment,shipping];
}
