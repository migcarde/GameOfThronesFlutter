import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';

class NetworkManager {
  Future<bool> hasInternetConnectio() async {
    if (!kIsWeb) {
      final conectivity = await (Connectivity().checkConnectivity());

      return conectivity != ConnectivityResult.none;
    }

    return true;
  }
}
