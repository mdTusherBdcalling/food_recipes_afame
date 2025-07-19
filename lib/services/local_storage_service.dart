import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const _tokenKey = 'token';
  static const _userId = 'userId';
    static const _savedLogins = 'saved_logins';
    static const name="name";


  // Save token
  Future<void> saveName(String userName) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(name, userName);
  }

  // Get token
  Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(name);
  }







  // Save token
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  // Get token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<void> saveUserId(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userId, token);
  }

  // Get token
  Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userId);
  }


  // Remove token (for logout)
  Future<void> removeToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }





  Future<void> saveLoginToLocal(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    // Load existing map from SharedPreferences
    String? jsonString = prefs.getString(_savedLogins);
    Map<String, String> loginsMap = {};

    if (jsonString != null) {
      loginsMap = Map<String, String>.from(json.decode(jsonString));
    }

    // Add new email-password pair (you may avoid duplicates here if needed)
    loginsMap[email] = password;

    // Save back to SharedPreferences
    await prefs.setString(_savedLogins, json.encode(loginsMap));
  }

  Future<Map<String, String>> getSavedLogins() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('saved_logins');
    if (jsonString != null) {
      return Map<String, String>.from(json.decode(jsonString));
    } else {
      return {};
    }
  }

  Future<void> removeLogin(String email) async {
    final prefs = await SharedPreferences.getInstance();
    final savedLoginsJson = prefs.getString(_savedLogins);

    if (savedLoginsJson == null) return;

    final Map<String, String> savedLogins =
        Map<String, String>.from(json.decode(savedLoginsJson));

    savedLogins.remove(email);

    // Save updated map
    await prefs.setString(_savedLogins, json.encode(savedLogins));
  }

}
