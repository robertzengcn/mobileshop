import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_repository/products_repository.dart';
import 'entities/entities.dart';

class FirebaseProductsRepository implements ProductsRepository {
  final productCollection = Firestore.instance.collection('product');


  @override
  Stream<List<Product>> products() {
    return productCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Product.fromEntity(ProductEntity.fromSnapshot(doc)))
          .toList();
    });
  }


}