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
  List<Countries> countries;
  QueryCustomerAddressSuccess({required this.customerAddressList,required this.countries});
  List<Object> get props => [customerAddressList];
}

class CustomerAddressErrorState extends CustomerAddressState {
  final String error;

  CustomerAddressErrorState({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'query customer address error { error: $error }';
}


