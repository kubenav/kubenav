import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static final Storage _instance = Storage._internal();

  factory Storage() {
    return _instance;
  }

  Storage._internal();

  FlutterSecureStorage? _storage;

  Future<void> init() async {
    _storage = const FlutterSecureStorage();
  }

  Future<void> write(String key, String value) async {
    await _storage?.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _storage?.read(key: key);
  }

  Future<void> delete(String key) async {
    return await _storage?.delete(key: key);
  }
}
