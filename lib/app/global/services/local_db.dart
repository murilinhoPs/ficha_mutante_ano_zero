import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  static SharedPreferences _prefs;

  static Future getItem(String keyName) async {
    _prefs = await SharedPreferences.getInstance();

    var key = _prefs.get(keyName);

    return key;
  }

  static Future setItemString(String keyName, String keyValue) async {
    _prefs = await SharedPreferences.getInstance();

    return await _prefs.setString(keyName, keyValue);
  }

  static Future setItemInt(String keyName, int keyValue) async {
    _prefs = await SharedPreferences.getInstance();

    return await _prefs.setInt(keyName, keyValue);
  }

  static Future setItemBool(String keyName, bool keyValue) async {
    _prefs = await SharedPreferences.getInstance();

    return await _prefs.setBool(keyName, keyValue);
  }

  static Future<bool> deleteItem(String keyName) async {
    _prefs = await SharedPreferences.getInstance();

    return await _prefs.remove(keyName);
  }

  static Future<bool> deleteAll() async {
    _prefs = await SharedPreferences.getInstance();

    return await _prefs.clear();
  }
}
