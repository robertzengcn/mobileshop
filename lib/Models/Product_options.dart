import 'package:equatable/equatable.dart';

class ProductOptions extends Equatable {
  final int products_option_id; // option id
  final String products_options_name;
  final int products_options_type;
  final bool products_options_images_style; //show image


  const ProductOptions(
      {
      required this.products_option_id,
      required this.products_options_name,
      required this.products_options_type,
      required this.products_options_images_style,
      });

  @override
  List<Object> get props => [
    products_option_id,
    products_options_name,
    products_options_type,
    products_options_images_style,
      ];


  static ProductOptions fromJson(dynamic json) {

//   print(products_image_list);
    return ProductOptions(
      products_option_id:json['products_options_id'] as int,
      products_options_name: json['products_options_name'],
      products_options_type: json['products_options_type'] as int,
      products_options_images_style: json['products_options_images_style'] as bool,
    );
  }
}
