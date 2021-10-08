//import 'package:meta/meta.dart';
import 'package:amigatoy/Models/models.dart';
import 'package:amigatoy/Repository/repository.dart';

class CustomerAddressRepository {
  CustomerAddressApiClient customerApiClient = new CustomerAddressApiClient();

  CustomerAddressRepository();

  ///get customer address
  Future<List<CustomerAddress?>> queryCustomeraddress() async {
    Future<List<CustomerAddress?>> lst =
        customerApiClient.queryCustomeraddress();
    return lst;
  }

  ///get countries list
  Future<List<Countries>> getCountrylist() async {
    Future<List<Countries>> lst = customerApiClient.getCountrylist();
    return lst;
  }

  ///get zones list
  Future<List<Zones?>> getZoneslist(int? id) async {
    Future<List<Zones?>> lst = customerApiClient.getZoneslist(id);
    return lst;
  }
}
