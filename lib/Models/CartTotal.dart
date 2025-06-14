import 'package:equatable/equatable.dart';

class CartTotal extends Equatable {

  final double totalPrice;
  final double totalWeight;


  CartTotal({
    required this.totalPrice,
    required this.totalWeight,
  });
  @override
  List<Object> get props => [
    totalPrice,
    totalWeight,
  ];

  static CartTotal fromJson(dynamic json) {
    double tmptotal=0;
   // tmptotal=json['total'].toDouble();
    //double tmpweight=0;
    //tmpweight=json['weight'].toDouble();
    //tmptotal=double.parse((json['total'].toDouble()).toStringAsFixed(2));
    //json['weight'];
    return CartTotal(
      totalPrice: double.parse((json['total'].toDouble()).toStringAsFixed(2)),
      totalWeight:double.parse((json['weight'].toDouble()).toStringAsFixed(2)),
    );
  }


}