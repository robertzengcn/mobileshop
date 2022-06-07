part of 'paypal_bloc.dart';


@immutable
abstract class PaypalEvent extends Equatable{}

class createPayment extends PaypalEvent {

  createPayment();
  @override
  List<Object> get props => [];
}

class executePayment extends PaypalEvent {
  final String url;
  final String payerId;
  final String accessToken;
  executePayment({
    required this.url,
    required this.payerId,
    required this.accessToken
  });

  @override
  List<Object> get props => [url,payerId,accessToken];
}

class successPayment extends PaypalEvent {
  final String paymentId;
  final String orderId;
  successPayment({required this.orderId,required this.paymentId});

  List<Object> get props => [orderId,paymentId];
}
class cancelPayment extends PaypalEvent {

  cancelPayment();
  @override
  List<Object> get props => [];
}
///unknow what is the payment status
class unkonwPayment extends PaypalEvent {

  unkonwPayment();
  @override
  List<Object> get props => [];
}

