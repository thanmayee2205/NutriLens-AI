import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String _loggedInKey = "logged_in";
  static const String _emailKey = "user_email";
  static const String _passwordKey = "user_password";

  static Future<void> register({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_emailKey, email);
    await prefs.setString(_passwordKey, password);
  }

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final savedEmail = prefs.getString(_emailKey);
    final savedPassword = prefs.getString(_passwordKey);

    if (savedEmail == email && savedPassword == password) {
      await prefs.setBool(_loggedInKey, true);
      return true;
    }

    return false;
  }

  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loggedInKey) ?? false;
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loggedInKey, false);
  }
}