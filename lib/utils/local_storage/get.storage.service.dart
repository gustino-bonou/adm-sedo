import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class StorageService extends GetxService {
  late final SharedPreferences _preferences;
  final Completer<void> _completer = Completer<void>();

  @override
  Future<void> onInit() async {
    _preferences = await SharedPreferences.getInstance();
    _completer.complete();
    super.onInit();
  }

  Future<void> _ensureInitialized() async {
    return _completer.future;
  }

  Future<bool> setString(String key, String value) async {
    await _ensureInitialized();
    return await _preferences.setString(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    await _ensureInitialized();
    return await _preferences.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    await _ensureInitialized();
    return await _preferences.setStringList(key, value);
  }

  Future<String?> getString(String key) async {
    await _ensureInitialized();
    return _preferences.getString(key);
  }

  Future<bool?> getBool(String key) async {
    await _ensureInitialized();
    return _preferences.getBool(key);
  }
}
