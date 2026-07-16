import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class HistoryService {
  static const String historyKey = "scan_history";

  static Future<void> saveHistory(
      Map<String, dynamic> scan) async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> history =
        prefs.getStringList(historyKey) ?? [];

    history.insert(0, jsonEncode(scan));

    await prefs.setStringList(historyKey, history);
  }

  static Future<List<Map<String, dynamic>>> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();

    final List<String> history =
        prefs.getStringList(historyKey) ?? [];

    return history
        .map((e) => jsonDecode(e) as Map<String, dynamic>)
        .toList();
  }

  static Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(historyKey);
  }
}