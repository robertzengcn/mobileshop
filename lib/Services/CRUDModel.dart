import 'dart:async';
import 'package:flutter/material.dart';
import '../locator.dart';
import '../Services/api.dart';
import '../ListItem/Product.dart';
import '../ListItem/ImageSlider.dart';
import '../ListItem/Category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class CRUDModel extends ChangeNotifier {
  //Api _api = locator<Api>();

  List<Product> products;
  List<ImageSlider> imageslider;
  List<Category> category;


  Future<List<Product>> fetchProducts() async {
    Api _api = new Api('product');
    var result = await _api.getDataCollection();
    //print(result.documents);
    products = result.documents
        .map((doc) => Product.fromMap(doc.data, doc.documentID))
        .toList();
    return products;
  }

  Stream<QuerySnapshot> fetchProductsAsStream() {
    Api _api = new Api('product');
    return _api.streamDataCollection();
  }

  Future<Product> getProductById(String id) async {
    Api _api = new Api('product');
    var doc = await _api.getDocumentById(id);
    return  Product.fromMap(doc.data, doc.documentID) ;
  }


  Future removeProduct(String id) async{
    Api _api = new Api('products');
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateProduct(Product data,String id) async{
    Api _api = new Api('product');
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addProduct(Product data) async{
    Api _api = new Api('product');
    var result  = await _api.addDocument(data.toJson()) ;

    return ;

  }

  Stream<QuerySnapshot> fetchSlideimageAsStream() {
    Api _api = new Api('image_slider');
    return _api.streamDataCollection();
  }

  Stream<QuerySnapshot> fetchCategoryAsStream() {
    Api _api = new Api('category');
    return _api.streamDataCollection();
  }
  Stream<QuerySnapshot> fetchHomeimageAsStream() {
    Firestore.instance.collection('image_slider').where('status', isEqualTo: 1).where('type',isEqualTo:'home')
        .snapshots();
  }




}