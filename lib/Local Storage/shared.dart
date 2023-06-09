import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage{

  static Future<void> set(String key, String value) async {
    final preferences= await SharedPreferences.getInstance();
    await preferences.setString(key, value);
  }

  static Future<String?> get(String key) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }
}