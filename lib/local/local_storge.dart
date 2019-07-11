import 'package:shared_preferences/shared_preferences.dart';

/// 封装loaclstorage本地信息存储
class LocalStorage {
  
  static save(String key, value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  static get(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.get(key);
  }

  static remove(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove(key); 
  }
}