part of 'customer_address_bloc.dart';

abstract class CustomerAddressState extends Equatable {
  const CustomerAddressState();
}

class CustomerAddressInitial extends CustomerAddressState {
  @override
  List<Object> get props => [];
}
class QueryCustomerAddressSuccess extends CustomerAddressState {
  @override
  List<CustomerAddress?> customerAddressList;
  QueryCustomerAddressSuccess({required this.customerAddressList});
  List<Object> get props => [];
}

class CustomerAddressErrorState extends CustomerAddressState {
  final String error;

  CustomerAddressErrorState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'query customer address error { error: $error }';
}


