import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:treva_shop_flutter/product_repository.dart';
import 'entities/entities.dart';

class FirebaseProductsRepository implements ProductsRepository {
  final productCollection = Firestore.instance.collection('product');


  @override
  Stream<List<Product>> products() {
    return productCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Todo.fromEntity(TodoEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> updateTodo(Todo update) {
    return todoCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}