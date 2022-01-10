// import 'package:amigatoy/UI/CartUIComponent/Payment.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';

class ListOrder extends Equatable {

  final List<Order?> lorder;
  final int totalNum;

  ListOrder({
    required this.lorder,
    required this.totalNum,
  });
  @override
  List<Object> get props => [
    lorder,totalNum
  ];

}