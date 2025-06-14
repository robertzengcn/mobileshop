import 'package:equatable/equatable.dart';

class ProductAtttibutes extends Equatable {
  final int products_attributes_id;
  final int products_option_id; // option id
  final int products_options_values_id; //Length: 76's id
  final int products_options_type;
  final String products_options_values_name; //ex stand
  final String? products_attributes_image; // image url
  final bool products_options_images_style;
  final String? products_options_images_url;

  const ProductAtttibutes(
      {required this.products_attributes_id,
      required this.products_option_id,
      required this.products_options_values_id,
        required this.products_options_type,
      required this.products_options_values_name,
      this.products_attributes_image,
        required this.products_options_images_style,
        this.products_options_images_url
      });

  @override
  List<Object> get props => [
    products_attributes_id,
    products_option_id,
    products_options_values_id,
    products_options_type,
    products_options_values_name,
    products_options_images_style,
      ];
  static ProductAtttibutes fromJson(dynamic json) {

//   print(products_image_list);
    return ProductAtttibutes(
      products_attributes_id:json['products_attributes_id'] as int,
      products_option_id: json['options_id'] as int,
      products_options_type:json['products_options_type'] as int,
      products_options_values_id: json['options_values_id'] as int,
      products_options_values_name: json['products_options_values_name'],
      products_options_images_style:json['products_options_images_style'] as bool,
      products_options_images_url:json['fullimage'],
    );
  }
}
