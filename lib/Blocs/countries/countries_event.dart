part of 'countries_bloc.dart';

@immutable
abstract class CountriesEvent extends Equatable{}

class QueryCountriesEvent extends CountriesEvent {
  @override
  List<Object> get props => [];
}
