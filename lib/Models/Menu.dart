import 'package:equatable/equatable.dart';

class Menu extends Equatable {

  final int id;
  final String title;
  final String value;
  final String desc;//菜单描述
  final String image;

  const Menu({
    this.id,
    this.title,
    this.value,
    this.desc,
    this.image,
  });
  @override
  List<Object> get props => [
    id,
    title,
    value,
    desc,
    image,
  ];

  static Menu fromJson(dynamic json) {
    return Menu(
        id: json['menu_id'] as int,
        title:json['menu_title'],
        value: json['menu_value'],
        desc:json['menu_desc'],
        image:json['menu_image'],
    );
  }


}