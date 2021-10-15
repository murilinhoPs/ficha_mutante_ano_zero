import 'package:ficha_mutante_ano_zero/src/global/services/local_storage/local_storage.dart';

class LocalStorageWrapper {
  static late LocalStorage _localStorage;

  static void initLocalStorage(LocalStorage localStorage) {
    _localStorage = localStorage;
  }

  static Future getItem(String keyName) async {
    final item = await _localStorage.getItem(keyName);

    return item;
  }

  static Future setItemString(String keyName, String keyValue) async {
    return await _localStorage.setItemString(keyName, keyValue);
  }

  static Future setItemInt(String keyName, int keyValue) async {
    return await _localStorage.setItemInt(keyName, keyValue);
  }

  static Future setItemBool(String keyName, bool keyValue) async {
    return await _localStorage.setItemBool(keyName, keyValue);
  }

  static Future<bool> deleteItem(String keyName) async {
    return await _localStorage.deleteItem(keyName);
  }

  static Future<bool> deleteAll() async {
    return await _localStorage.deleteAll();
  }
}
