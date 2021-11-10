part of 'paypal_bloc.dart';

@immutable
abstract class PaypalState {}

class PaypalInitial extends PaypalState {}

class Paypalcreatesuccess extends PaypalState {
  final String? checkoutUrl;
  final String? executeUrl;

  Paypalcreatesuccess({this.checkoutUrl,this.executeUrl});
}