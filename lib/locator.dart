import 'package:get_it/get_it.dart';
import './Services/api.dart';
import './Services/CRUDModel.dart';



GetIt locator = GetIt();

void setupLocator() {
  //locator.registerLazySingleton(() => Api('products'));
 locator.registerLazySingleton<Api>(() => Api('products'));
 //locator.registerLazySingleton<Api>(() => Api('category'));

  locator.registerLazySingleton(() => CRUDModel()) ;
}