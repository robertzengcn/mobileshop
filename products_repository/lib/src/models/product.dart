import 'package:meta/meta.dart';
import '../entities/entities.dart';
@immutable
class Product {

  final int id;
  final double price;
  final String title;
  final String img;
  final int rattingValue;
  final int itemSale;
  final String description;
  final int catalogueId;

  Product(this.id, this.price, this.title,this.img,this.rattingValue,this.itemSale,this.description,this.catalogueId);




  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ img.hashCode ^ rattingValue.hashCode ^ itemSale.hashCode ^ description.hashCode ^ catalogueId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Product &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              price == other.price &&
              title == other.title &&
              img== other.img &&
              rattingValue== other.rattingValue &&
              itemSale== other.itemSale &&
              description== other.description &&
              catalogueId==other.catalogueId;

  @override
  String toString() {
    return 'Product { id: $id, price: $price, title: $title, img: $img, rattingValue:$rattingValue,itemSale:$itemSale,description:$description,catalogueId:$catalogueId}';
  }

  ProductEntity toEntity() {
    return ProductEntity(id, price, title,img,rattingValue,itemSale,description,catalogueId);
  }

  static Product fromEntity(ProductEntity entity) {
    return Product(
       entity.id,
      entity.price,
      entity.title,
      entity.img,
      entity.rattingValue,
      entity.itemSale,
       entity.description,
       entity.catalogueId
    );
  }
}