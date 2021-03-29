import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';

class NetworkManager {
  late final Connectivity connectivity;

  NetworkManager({required this.connectivity});

  Future<bool> get hasInternetConnection async {
    if (!kIsWeb) {
      final conectivity = await (connectivity.checkConnectivity());

      return conectivity != ConnectivityResult.none;
    }

    return true;
  }
}
