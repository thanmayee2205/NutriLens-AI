import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {

  // Android Emulator -> localhost
  static const String baseUrl = "http://192.168.1.2:8000";

  static Future<Map<String, dynamic>> analyzeFood({

    required String ocrText,

    required int age,

    required String gender,

    required double height,

    required double weight,

    required List<String> medicalConditions,

    required List<String> allergies,

    required List<String> dietPreferences,

  }) async {

    final response = await http.post(

      Uri.parse("$baseUrl/analyze"),

      headers: {
        "Content-Type": "application/json",
      },

      body: jsonEncode({

        "ocr_text": ocrText,

        "age": age,

        "gender": gender,

        "height": height,

        "weight": weight,

        "medical_conditions": medicalConditions,

        "allergies": allergies,

        "diet_preferences": dietPreferences,

      }),

    );

    if (response.statusCode == 200) {

      return jsonDecode(response.body);

    }

    throw Exception("Failed to analyze food.");
  }
}