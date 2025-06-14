// You can pass any object to the arguments parameter.
// In this example, create a class that contains both
// a customizable title and message.
import 'package:amigatoy/Models/models.dart';


class CheckoutArguments {
  final CartTotal? cartTotal;
  final List<Payment?> paymentList;
  final String symbol;
  final List<ShippingMethod?> shippingMelist;
  CheckoutArguments(this.cartTotal,this.paymentList,this.symbol,this.shippingMelist);
}