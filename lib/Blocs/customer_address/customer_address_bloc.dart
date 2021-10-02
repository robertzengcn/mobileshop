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
        yield QueryCustomerAddressSuccess(
            customerAddressList: customerAddresslist);
      } catch (error, stacktrace) {
        yield CustomerAddressErrorState(
            error: 'Exception: ' +
                error.toString() +
                'Stacktrace: ' +
                stacktrace.toString());
      }
    }
   
  }
}
