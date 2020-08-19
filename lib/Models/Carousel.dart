import 'package:parse_server_sdk/parse_server_sdk.dart';
const String _keyTableName = 'Carousel';
const String keyUrl = 'url';

class Carousel extends ParseObject implements ParseCloneable {

  Carousel() : super(_keyTableName);
  Carousel.clone(): this();

  /// Looks strangely hacky but due to Flutter not using reflection, we have to
  /// mimic a clone
  @override clone(Map map) => Carousel.clone()..fromJson(map);
  String get url => get<String>(keyUrl);

}