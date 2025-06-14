part of 'countries_bloc.dart';

@immutable
abstract class CountriesState extends Equatable{}

class CountriesInitial extends CountriesState {
  @override
  List<Object> get props => [];
}

class QueryCountriesSuccessState extends CountriesState {

  final List<Countries> countries;
  QueryCountriesSuccessState({required this.countries});
  List<Object> get props => [Countries];
}

class QueryCountriesErrorState extends CountriesState {
  final String error;

  QueryCountriesErrorState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'query countries address error { error: $error }';
}
