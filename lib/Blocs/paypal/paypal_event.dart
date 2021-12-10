part of 'paypal_bloc.dart';


@immutable
abstract class PaypalEvent extends Equatable{}

class createPayment extends PaypalEvent {
  final PaypalRequest paypalrequest;
  createPayment({required this.paypalrequest});
  @override
  List<Object> get props => [paypalrequest];
}

class executePayment extends PaypalEvent {
  String url;
  String payerId;
  String accessToken;
  executePayment({
    required this.url,
    required this.payerId,
    required this.accessToken
  });

  @override
  List<Object> get props => [url,payerId,accessToken];
}
