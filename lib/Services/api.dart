import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
class Api{
  final Firestore _db = Firestore.instance;
 final String path;
  CollectionReference ref;

  Api( this.path ) {

    ref = _db.collection(path);
  }

  void SwitchPath(String path){

    ref = _db.collection(path);
  }

  Future<QuerySnapshot> getDataCollection() {
    return ref.getDocuments() ;
  }
  Stream<QuerySnapshot> streamDataCollection() {

    return ref.snapshots() ;
  }
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.document(id).get();
  }
  Future<void> removeDocument(String id){
    return ref.document(id).delete();
  }
  Future<DocumentReference> addDocument(Map data) {
    return ref.add(data);
  }
  Future<void> updateDocument(Map data , String id) {
    return ref.document(id).updateData(data) ;
  }
  Stream<QuerySnapshot> fetchlevelCategoryAsStream(int level,[int top=0]){
    return ref.where('level', isEqualTo: level).where('top', isEqualTo: top).orderBy("id").snapshots();
  }
  Stream<QuerySnapshot> fetchProductsAsStream([int catelogue_id]){

    if(catelogue_id!=null){


      ref.where('CatalogueId', isEqualTo: catelogue_id);
    }
    return ref.snapshots();
  }
  Stream<QuerySnapshot> fetchTypeimageAsStream(String type){
    ref.where('status', isEqualTo: 1).where('type',isEqualTo:type)
    .snapshots();
  }




}