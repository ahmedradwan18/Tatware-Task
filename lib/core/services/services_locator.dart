
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../network/network_info.dart';

final sl=GetIt.instance;

class ServicesLocator{
  void init(){

    

    /// CORE
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

    /// EXTERNAL
    sl.registerLazySingleton(() => InternetConnectionChecker());




  }
}