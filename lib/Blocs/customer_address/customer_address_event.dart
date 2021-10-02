part of 'customer_address_bloc.dart';

abstract class CustomerAddressEvent extends Equatable {
  const CustomerAddressEvent();
}
class QueryCustomerAddressEvent extends CustomerAddressEvent {
  @override
  List<Object> get props => [];
}

class CustomerAddressSuccessEvent extends CustomerAddressEvent {
  @override
  List<Object> get props => [];
}



