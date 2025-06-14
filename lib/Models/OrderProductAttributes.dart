import 'package:equatable/equatable.dart';

class OrderProductAttributes extends Equatable {
    final String option;
    final String value;
    final int optionId;
    final int valueId;

    const OrderProductAttributes(
        {required this.option,
          required this.value,
          required this.optionId,
          required this.valueId,
        });

    @override
    List<Object> get props => [
      option,
      value,
      optionId,
      valueId,
    ];

    static OrderProductAttributes fromJson(dynamic json) {

      return OrderProductAttributes(
          option: json['option'],
          value :json['value'],
          optionId: json['option_id'],
          valueId: json['value_id'],
      );
    }
}