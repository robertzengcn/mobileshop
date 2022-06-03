// import 'package:amigatoy/UI/CartUIComponent/Payment.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';

class ListFeature extends Equatable {

  final List<Product?> lps;
  final int totalNum;

  ListFeature({
    required this.lps,
    required this.totalNum,
  });
  @override
  List<Object> get props => [
    lps,totalNum
  ];
}