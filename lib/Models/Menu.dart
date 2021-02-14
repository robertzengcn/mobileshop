import 'package:equatable/equatable.dart';

class Menu extends Equatable {

  final int id;
  final String title;
  final String value;

  const Menu({
    this.id,
    this.title,
    this.value,
  });
  @override
  List<Object> get props => [
    id,
    title,
    value
  ];

  static Menu fromJson(dynamic json) {
    return Menu(
        id: json['menu_id'] as int,
        title:json['menu_title'],
        value: json['menu_value']
    );
  }


}