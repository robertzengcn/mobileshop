part of 'customer_address_bloc.dart';

abstract class CustomerAddressEvent extends Equatable {
  const CustomerAddressEvent();
}
class QueryCustomerAddressEvent extends CustomerAddressEvent {
  @override
  List<Object> get props => [];
}
///add customer address success
class CustomerAddressSuccessEvent extends CustomerAddressEvent {
  @override
  List<Object> get props => [];
}
///add customer address event
class AddCustomerAddressEvent extends CustomerAddressEvent {
  final CustomerAddress customerAddress;
  AddCustomerAddressEvent({required this.customerAddress});

  @override
  List<Object> get props => [];
}
///set default customer address
class SetdefaultAddressEvent extends CustomerAddressEvent {
  final int customerAddid;
  SetdefaultAddressEvent({required this.customerAddid});
  @override
  List<Object> get props => [];
}



