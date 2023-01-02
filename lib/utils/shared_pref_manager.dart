import "dart:developer";

import "package:shared_preferences/shared_preferences.dart";

class SharedPrefManager {
  factory SharedPrefManager() {
    return _singleton;
  }

  SharedPrefManager._internal();
  static final SharedPrefManager _singleton = SharedPrefManager._internal();

  SharedPreferences? prefs;

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    log("initSharedPreferences called");
    return Future<void>.value();
  }

  Future<bool> setData(String key, String value) async {
    final bool isSaved = await prefs?.setString(key, value) ?? false;
    log("setData - Key: $key : Value: $value - isSaved: $isSaved");
    return Future<bool>.value(isSaved);
  }

  String getData(String key) {
    final String value = prefs?.getString(key) ?? "";
    if (value != "") {
      log("getData - Key: $key : Value: $value");
    }
    return value;
  }

  Future<bool> deleteData(String key) async {
    final bool isDeleted = await prefs?.remove(key) ?? false;
    log("deleteData - Key: $key - isDeleted: $isDeleted");
    return Future<bool>.value(isDeleted);
  }
}
