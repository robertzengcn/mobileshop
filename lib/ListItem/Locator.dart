
import 'package:get_it/get_it.dart';

import './Api.dart';
import './CRUDModel.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => Api('products'));
  locator.registerLazySingleton(() => CRUDModel()) ;
}