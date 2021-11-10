part of 'paypal_bloc.dart';


@immutable
abstract class PaypalEvent extends Equatable{}

class createPayment extends PaypalEvent {
  final Invoice invoice;
  createPayment({required this.invoice});
  @override
  List<Object> get props => [];
}
