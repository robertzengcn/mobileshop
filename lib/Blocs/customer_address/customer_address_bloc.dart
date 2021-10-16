import 'dart:async';

import 'package:amigatoy/Repository/CustomerAddressRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:amigatoy/Models/models.dart';

part 'customer_address_event.dart';
part 'customer_address_state.dart';

class CustomerAddressBloc
    extends Bloc<CustomerAddressEvent, CustomerAddressState> {
  final CustomerAddressRepository customerAddressRepository;
  CustomerAddressBloc({required this.customerAddressRepository})
      : super(CustomerAddressInitial());

  @override
  Stream<CustomerAddressState> mapEventToState(
    CustomerAddressEvent event,
  ) async* {
    if (event is QueryCustomerAddressEvent) {
      try {
        List<CustomerAddress?> customerAddresslist =
            await customerAddressRepository.queryCustomeraddress();
        List<Countries> countriesList =
            await customerAddressRepository.getCountrylist();
        yield QueryCustomerAddressSuccess(
            customerAddressList: customerAddresslist, countries: countriesList);
      } catch (error, stacktrace) {
        yield CustomerAddressErrorState(
            error: 'Exception: ' +
                error.toString() +
                'Stacktrace: ' +
                stacktrace.toString());
      }
    } else if (event is AddCustomerAddressEvent) {
      try {
        await customerAddressRepository.saveAddress(event.customerAddress);
        yield AddCustomerAddsuccessState();
      } catch (error) {
        yield CustomerAddressErrorState(
            error: 'Exception: ' + error.toString());
      }
    } else if (event is SetdefaultAddressEvent) {
      try {
        await customerAddressRepository.setdefaultAddress(event.customerAddid);
        yield SetCustomersuccessState();
      } catch (error) {
        yield CustomerAddressErrorState(
            error: 'Exception: ' + error.toString());
      }
    }
  }
}
