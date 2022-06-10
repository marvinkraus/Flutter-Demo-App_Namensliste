import 'package:connectivity_plus/connectivity_plus.dart';

class Networking {
  static bool isAvailable = false;

  static init() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        isAvailable = true;
      } else {
        isAvailable = false;
      }

      print("isAvailable: $isAvailable");
    });
  }
}
