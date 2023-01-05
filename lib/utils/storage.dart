import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static final Storage _instance = Storage._internal();

  factory Storage() {
    return _instance;
  }

  Storage._internal();

  FlutterSecureStorage? _mobileStorage;
  SharedPreferences? _desktopStorage;

  Future<void> init() async {
    if (Platform.isAndroid || Platform.isIOS) {
      _mobileStorage = const FlutterSecureStorage();
    } else {
      _desktopStorage = await SharedPreferences.getInstance();
    }
  }

  Future<void> write(String key, String value) async {
    if (Platform.isAndroid || Platform.isIOS) {
      await _mobileStorage?.write(key: key, value: value);
    } else {
      await _desktopStorage?.setString(key, value);
    }
  }

  Future<String?> read(String key) async {
    if (Platform.isAndroid || Platform.isIOS) {
      return await _mobileStorage?.read(key: key);
    } else {
      return _desktopStorage?.getString(key);
    }
  }
}
