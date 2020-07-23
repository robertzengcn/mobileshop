import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final double price;
  final String title;
  final String img;
  final int rattingValue;
  final int itemSale;
  final String description;
  final int catalogueId;



  const ProductEntity(this.id, this.price, this.title,this.img,this.rattingValue,this.itemSale,this.description,this.catalogueId);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "price": price,
      "img": img,
      "rattingValuec": rattingValue,
      "itemSale":itemSale,
      "description":description,
      "catalogueId":catalogueId,
    };
  }
  @override
  List<Object> get props => [id, price,catalogueId];

  @override
  String toString() {
    return 'ProductEntity { id: $id, price: $price, title: $title, img: $img,rattingValue:$rattingValue,itemSale:$itemSale,description:$description,catalogueId:$catalogueId}';
  }

  static ProductEntity fromJson(Map<String, Object> json) {
    return ProductEntity(
    json["id"] as int,
    json["price"] as double,
    json["title"] as String,
    json["img"] as String,
    json["rattingValue"] as int,
    json["itemSale"] as int,
    json["description"] as String,
    json["catalogueId"] as int
    );
  }

  static ProductEntity fromSnapshot(DocumentSnapshot snap) {
    return ProductEntity(
      snap.data['id'],
      snap.data['price'],
      snap.data['title'],
      snap.data['img'],
      snap.data['rattingValue'],
      snap.data['itemSale'],
      snap.data['description'],
      snap.data['catalogueId'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "id": id,
      "price": price,
      "title": title,
      "img":img,
      "rattingValue":rattingValue,
      "itemSale":itemSale,
      "description":description,
      "catalogueId":catalogueId
    };
  }
}



