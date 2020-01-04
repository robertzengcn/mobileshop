import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreProvider {
  Firestore _firestore = Firestore.instance;

  Stream<QuerySnapshot> catelogueImagesList(String type) {
    return _firestore.collection('image_slider').where('status', isEqualTo: 1).where('type',isEqualTo:type)
        .snapshots();
  }

  Stream<QuerySnapshot> fetchlevelCategoryAsStream(int level,[int top=0]) {

    return _firestore.collection('category').where('level', isEqualTo: level).where('top', isEqualTo: top).orderBy("id").snapshots();
  }




}