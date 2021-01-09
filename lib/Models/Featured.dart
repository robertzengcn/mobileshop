import 'package:parse_server_sdk/parse_server_sdk.dart';



class Featured extends ParseObject implements ParseCloneable {


  Featured() : super(_keyMenuTableName);
  Featured.clone(): this();

  static const String _keyMenuTableName = 'Product';
  static const String keyMenuTitle = 'title';
  static const String keyMenuType = 'type';

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override clone(Map map) => Featured.clone()..fromJson(map);
  String get title => get<String>(keyMenuTitle);

}