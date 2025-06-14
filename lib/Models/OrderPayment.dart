import 'package:equatable/equatable.dart';
// import 'package:amigatoy/Models/models.dart';

class OrderPayment extends Equatable {
  final String paymentStatus;
  final String txnId;
  final String paymentDate;


  OrderPayment({
    required this.paymentStatus,
    required this.txnId,
    required this.paymentDate,
    });
  @override
  List<Object> get props => [paymentStatus,txnId,paymentDate];

  static OrderPayment fromJson(dynamic json) {
      return OrderPayment(
        paymentStatus: json['payment_status'],
        txnId: json['txn_id'],
        paymentDate: json['payment_date']
      );
  }
}
