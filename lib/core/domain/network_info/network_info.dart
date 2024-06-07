import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

abstract class NetworkInfo {
  Future<bool> isConnectedWitchGoogle();
}

class NetworkInfoImpl implements NetworkInfo {
  Stream<List<ConnectivityResult>> connectivity =
      Connectivity().onConnectivityChanged;
  @override
  Future<bool> isConnectedWitchGoogle() async {
    try {
      final isConnected =
          await Dio(BaseOptions()).get('https://www.google.com/');
      return isConnected.data != null && isConnected.statusCode != null;
    } on DioException {
      return false;
    }
  }
}
