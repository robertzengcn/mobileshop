import 'package:cloud_firestore/cloud_firestore.dart';

import 'firestore_provider.dart';


class Repository {
  final _firestoreProvider = FirestoreProvider();


  Stream<QuerySnapshot> catelogueImagesList(String type) => _firestoreProvider.catelogueImagesList(type);

  Stream<QuerySnapshot> fetchlevelCategoryAsStream(int level,[int top=0]) => _firestoreProvider.fetchlevelCategoryAsStream(level,top);
}