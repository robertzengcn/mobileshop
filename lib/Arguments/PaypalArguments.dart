// You can pass any object to the arguments parameter.
// In this example, create a class that contains both
// a customizable title and message.
// import 'package:amigatoy/Models/models.dart';
// import 'package:amigatoy/Models/Product.dart';

class PaypalArguments {
  final String checkoutUrl;
  final String returnUrl;
  final String cancelUrl;
  final String orderId;
  PaypalArguments(this.checkoutUrl,this.returnUrl,this.cancelUrl,this.orderId);
}