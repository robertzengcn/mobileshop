import 'package:equatable/equatable.dart';

class Carousel extends Equatable {

  final int id;
  final String title;
  final String url;
  final String type;

  const Carousel({
    this.id,
    this.title,
    this.url,
    this.type
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