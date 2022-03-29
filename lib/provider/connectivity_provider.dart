import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityProvider with ChangeNotifier{
  bool _isOnline=true;
  bool get isOnline=> _isOnline;

  ConnectivityProvider(){
    Connectivity _connectivity=Connectivity();

    _connectivity.onConnectivityChanged.listen((event) async{
      if(event==ConnectivityResult.none){
        _isOnline=false;
        notifyListeners();
      }else{
        _isOnline=true;
        notifyListeners();
      }
    });
  }

}