import 'package:equatable/equatable.dart';

class Zones extends Equatable {

  final int zone_id;
  final String zone_code;
  final String zone_name;

  Zones({
    required this.zone_id,
    required this.zone_code,
    required this.zone_name,
  });
  @override
  List<Object> get props => [
    zone_id,
    zone_code,
    zone_name,
  ];

  static Zones fromJson(dynamic json) {

    return Zones(
      zone_id: json['zone_id'],
      zone_code:json['zone_code'].toString(),
      zone_name: json['zone_name'].toString(),
    );
  }


}