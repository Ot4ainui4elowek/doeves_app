import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SecureStorageKeys {
  static const token = 'token';
}

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  Future<void> writeToken({required String token}) async {
    await storage.write(key: SecureStorageKeys.token, value: token);
  }

  Future<String?> readToken() {
    return storage.read(key: SecureStorageKeys.token);
  }

  Future<void> deleteAllSecure() async {
    await storage.deleteAll();
  }
}
