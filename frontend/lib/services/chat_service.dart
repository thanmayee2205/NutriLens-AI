import 'dart:convert';

import 'package:http/http.dart' as http;

class ChatService {
  // Laptop IP address
  static const String baseUrl = "http://192.168.1.2:8000";

  static Future<String> askAI({
    required String question,
    required String productAnalysis,
    required int age,
    required String gender,
    required List<String> medicalConditions,
    required List<String> allergies,
    required List<String> dietPreferences,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/chat"),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "question": question,
        "product_analysis": productAnalysis,
        "age": age,
        "gender": gender,
        "medical_conditions": medicalConditions,
        "allergies": allergies,
        "diet_preferences": dietPreferences,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception("Failed to get AI response.");
    }

    final data = jsonDecode(response.body);

    return data["answer"];
  }
}