import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static const String userKey = "user_profile";

  static Future<void> saveUser(
      Map<String, dynamic> user) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      userKey,
      jsonEncode(user),
    );
  }

  static Future<Map<String, dynamic>?> loadUser() async {
    final prefs = await SharedPreferences.getInstance();

    final json = prefs.getString(userKey);

    if (json == null) {
      return null;
    }

    return Map<String, dynamic>.from(
      jsonDecode(json),
    );
  }

  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(userKey);
  }
}