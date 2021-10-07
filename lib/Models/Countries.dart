import 'package:equatable/equatable.dart';

class Countries extends Equatable {

  final int countriesId;
  final String countriesName;

  Countries({
    required this.countriesId,
    required this.countriesName,
  });
  @override
  List<Object> get props => [
    countriesId,
    countriesName,
  ];

  static Countries fromJson(dynamic json) {

    return Countries(
      countriesId: json['countries_id'],
      countriesName:json['countries_name'],
    );
  }


}