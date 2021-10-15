import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageImpl implements LocalStorage {
  late SharedPreferences _prefs;

  @override
  Future getItem(String keyName) async {
    _prefs = await SharedPreferences.getInstance();

    final keyValue = _prefs.get(keyName);

    return keyValue;
  }

  @override
  Future setItemString(String keyName, String keyValue) async {
    _prefs = await SharedPreferences.getInstance();

    return await _prefs.setString(keyName, keyValue);
  }

  @override
  Future setItemInt(String keyName, int keyValue) async {
    _prefs = await SharedPreferences.getInstance();

    return await _prefs.setInt(keyName, keyValue);
  }

  @override
  Future setItemBool(String keyName, bool keyValue) async {
    _prefs = await SharedPreferences.getInstance();

    return await _prefs.setBool(keyName, keyValue);
  }

  @override
  Future<bool> deleteItem(String keyName) async {
    _prefs = await SharedPreferences.getInstance();

    return await _prefs.remove(keyName);
  }

  @override
  Future<bool> deleteAll() async {
    _prefs = await SharedPreferences.getInstance();

    return await _prefs.clear();
  }
}
