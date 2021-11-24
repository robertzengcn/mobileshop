// You can pass any object to the arguments parameter.
// In this example, create a class that contains both
// a customizable title and message.
import 'package:amigatoy/Models/Invoice.dart';
// import 'package:amigatoy/Models/Product.dart';

class PaypalArguments {
  final Invoice? invoice;
  PaypalArguments(this.invoice);
}