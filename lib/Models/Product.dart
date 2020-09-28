import 'package:parse_server_sdk/parse_server_sdk.dart';



class Product extends ParseObject implements ParseCloneable {


  Product() : super(_keyMenuTableName);
  Product.clone(): this();

  static const String _keyMenuTableName = 'Product';
  static const String keyMenuTitle = 'title';
  static const String keyMenuType = 'type';

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override clone(Map map) => Product.clone()..fromJson(map);
  String get title => get<String>(keyMenuTitle);

}