import 'package:parse_server_sdk/parse_server_sdk.dart';
const String _keyMenuTableName = 'Menu';
const String keyTitle = 'title';


class Menu extends ParseObject implements ParseCloneable {

  Menu() : super(_keyMenuTableName);
  Menu.clone(): this();

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override clone(Map map) => Menu.clone()..fromJson(map);
  String get title => get<String>(keyTitle);

}