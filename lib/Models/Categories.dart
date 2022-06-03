import 'package:equatable/equatable.dart';

class Categories extends Equatable {

  final int categoriesId;
  final int parentId;
  final String categoriesImageUrl;
  final String categoriesName;
  final bool hasChild;
  final String categoriesDesc;

  const Categories({
    required this.categoriesId,
    required this.parentId,
    required this.categoriesImageUrl,
    required this.categoriesName,
    required this.hasChild,
    required this.categoriesDesc,
  });
  @override
  List<Object> get props => [
    categoriesId,
    parentId,
    categoriesImageUrl,
    categoriesName,
    hasChild,
    categoriesDesc
  ];

  static Categories fromJson(dynamic json) {
    return Categories(
        categoriesId: json['categories_id'] as int,
        parentId: json['parent_id'],
        categoriesImageUrl:json['categories_image_url'],
        categoriesName:json['categories_name'],
        hasChild:json['has_sub'],
        categoriesDesc:json['categories_description'],
    );
  }

}