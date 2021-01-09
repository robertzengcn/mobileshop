import 'package:parse_server_sdk/parse_server_sdk.dart';



class Product extends ParseObject implements ParseCloneable {


  Product() : super(_keyProductTableName);
  Product.clone(): this();

  static const String _keyProductTableName = 'Product';
  static const String keyProductTitle = 'title';
  static const String keyProductType = 'type';
  static const String keyProductId = 'id';
  static const String keyProductImg = 'img';
  static const String keyProductPrice = 'price';

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override clone(Map map) => Product.clone()..fromJson(map);
  String get title => get<String>(keyProductTitle);
  String get id => get<String>(keyProductId);
  String get img => get<String>(keyProductImg);
  String get price => get<String>(keyProductImg);
}