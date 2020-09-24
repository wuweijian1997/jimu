import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static SharedPreferences sharedPreferences;

  static set(String key, String value) async {
    await _init();
    sharedPreferences.setString(key, value);
  }

  static Future<T> get<T>(String key) async {
    await _init();
    return sharedPreferences.get(key) as T;
  }

  static _init() async {
    if (sharedPreferences == null) {
      sharedPreferences = await SharedPreferences.getInstance();
    }
  }
}
