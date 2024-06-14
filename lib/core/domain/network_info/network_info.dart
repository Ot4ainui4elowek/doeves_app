import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:reactive_variables/reactive_variables.dart';

abstract class NetworkInfo {
  Future<bool> isConnectedWitchGoogle();
}

class NetworkInfoServiceImpl implements NetworkInfo {
  NetworkInfoServiceImpl() {
    networkListener = connectivity.listen(
      (event) => networkIsConnected(
        event.any(
          (connection) =>
              connection == ConnectivityResult.wifi ||
              connection == ConnectivityResult.ethernet ||
              connection == ConnectivityResult.mobile ||
              connection == ConnectivityResult.other,
        ),
      ),
    );
  }
  Stream<List<ConnectivityResult>> connectivity =
      Connectivity().onConnectivityChanged.asBroadcastStream();

  final networkIsConnected = false.rv;
  late final StreamSubscription<List<ConnectivityResult>> networkListener;
  @override
  Future<bool> isConnectedWitchGoogle() async {
    try {
      final isConnected =
          await Dio(BaseOptions()).get('https://www.google.com/');
      return isConnected.data != null &&
          isConnected.statusCode != null &&
          networkIsConnected.value;
    } on DioException {
      return false;
    }
  }
}
