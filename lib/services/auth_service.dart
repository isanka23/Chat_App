import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  // No need for Future here, just SharedPreferences
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> loginUser(String userName) async {
    try {
      // You can directly use _prefs here as it's already initialized
      _prefs.setString("userName", userName);
    } catch (e) {
      print(e);
    }
  }

  Future <bool> isLoggedIn() async {
    String? userName = _prefs.getString("userName");
    if(userName == null) return false;
    return true;
  }

  void logOutUser() {
    _prefs.clear();
  }

  String? getCurrentUser() {
    // No need to await _prefs, it's already initialized
    return _prefs.getString("userName") ?? "Default User";
  }

  void UpdateUserName(String newUserName) {
    _prefs.setString("userName", newUserName);
    notifyListeners();
  }
}
