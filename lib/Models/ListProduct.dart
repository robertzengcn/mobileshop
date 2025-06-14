// import 'package:amigatoy/UI/CartUIComponent/Payment.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';

class ListProduct extends Equatable {

  final List<Product?> lproduct;
  final int totalNum;

  ListProduct({
    required this.lproduct,
    required this.totalNum,
  });
  @override
  List<Object> get props => [
    lproduct,totalNum
  ];

}