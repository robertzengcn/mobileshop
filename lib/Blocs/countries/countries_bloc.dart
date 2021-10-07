import 'dart:async';
import 'package:amigatoy/Repository/CustomerAddressRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';

part 'countries_event.dart';
part 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final CustomerAddressRepository customerAddressRepository;
  CountriesBloc({required this.customerAddressRepository}) : super(CountriesInitial());

  @override
  Stream<CountriesState> mapEventToState(
    CountriesEvent event,
  ) async* {
    if (event is QueryCountriesEvent) {
      try {
      List<Countries> countriesList=await customerAddressRepository.getCountrylist();
      yield QueryCountriesSuccessState(
         countries: countriesList);
      } catch (error, stacktrace) {
        yield QueryCountriesErrorState(
            error: 'Exception: ' +
                error.toString() +
                'Stacktrace: ' +
                stacktrace.toString());
      }
    }
  }
}
