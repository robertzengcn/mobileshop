//import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/repository.dart';




class CustomerAddressRepository{
 CustomerAddressApiClient customerApiClient=new CustomerAddressApiClient();

  CustomerAddressRepository();

  ///get customer address
  Future<List<CustomerAddress?>> queryCustomeraddress() async {
    Future<List<CustomerAddress?>> lst = customerApiClient.queryCustomeraddress();
    return lst;
  }
}
