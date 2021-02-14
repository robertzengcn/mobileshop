import 'package:equatable/equatable.dart';

class Carousel extends Equatable {

  final int id;
  final String title;
  final String url;

  const Carousel({
    this.id,
    this.title,
    this.url,
  });
  @override
  List<Object> get props => [
    id,
    title,
    url
  ];

  static Carousel fromJson(dynamic json) {
    return Carousel(
        id: json['id'] as int,
        title:json['title'],
        url: json['url']
    );
  }

}