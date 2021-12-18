part of 'paypal_bloc.dart';

@immutable
abstract class PaypalState extends Equatable{}

class PaypalInitial extends PaypalState {
  @override
  List<Object> get props => [];
}
///create checkout url,executeurl success
class PaypalcreatesuccessState extends PaypalState {
  final String checkoutUrl;
  final String executeUrl;
  final String accessToken;

  PaypalcreatesuccessState({required this.checkoutUrl,required this.executeUrl,required this.accessToken});
  @override
  List<Object> get props => [checkoutUrl,executeUrl,accessToken];
}
///loading paypal, or waiting data from paypal
class PaypalpenddingState extends PaypalState {
  @override
  List<Object> get props => [];
}
///make paypal payment error
class PaypalErrorState extends PaypalState {
  final String error;

  PaypalErrorState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'create error { error: $error }';
}

///make paypal payment error
class PaypalFinishState extends PaypalState {
  String paymentId;
  PaypalFinishState({required this.paymentId});

  @override
  List<Object> get props => [paymentId];
}
///start to open paypal payment page
class PaypalCreateState extends PaypalState {

  PaypalCreateState();

  @override
  List<Object> get props => [];
}