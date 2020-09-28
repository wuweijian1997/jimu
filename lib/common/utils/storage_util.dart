import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static SharedPreferences _sharedPreferences;

  static set(String key, String value) async {
    await _init();
    _sharedPreferences.setString(key, value);
  }

  static Future<String> get(String key) async {
    await _init();
    return _sharedPreferences.get(key);
  }

  static _init() async {
    if (_sharedPreferences == null) {
      _sharedPreferences = await SharedPreferences.getInstance();
    }
  }
}
