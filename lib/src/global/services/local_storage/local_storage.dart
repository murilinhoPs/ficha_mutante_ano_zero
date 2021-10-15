abstract class LocalStorage {
  Future getItem(String keyName) async {}

  Future getStringList(String keyName) async {}

  Future setListString(String keyName, List<String> keyValue) async {}

  Future setItemString(String keyName, String keyValue) async {}

  Future setItemInt(String keyName, int keyValue) async {}

  Future setItemBool(String keyName, bool keyValue) async {}

  Future deleteItem(String keyName) async {}

  Future deleteAll() async {}
}
