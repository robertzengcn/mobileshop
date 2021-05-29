import 'package:equatable/equatable.dart';

class Carousel extends Equatable {

  final int id;
  final String title;
  final String url;
  final String type;

  const Carousel({
    required this.id,
    required this.title,
    required this.url,
    required this.type
  });
  @override
  List<Object> get props => [
    id,
    title,
    url,
    type
  ];

  static Carousel fromJson(dynamic json) {
    return Carousel(
        id: json['carousel_id'] as int,
        title:json['carousel_title'],
        url: json['carousel_url'],
        type:json['carousel_type']
    );
  }

}