import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../database/scan_history_service.dart';
import '../../models/scan_history_model.dart';
import '../../core/data/app_data.dart';
import '../../models/analysis_result_model.dart';
import '../../services/api_service.dart';
import '../analysis/analysis_screen.dart';

class OCRResultScreen extends StatefulWidget {
  final String extractedText;

  const OCRResultScreen({
    super.key,
    required this.extractedText,
  });

  @override
  State<OCRResultScreen> createState() => _OCRResultScreenState();
}

class _OCRResultScreenState extends State<OCRResultScreen> {
  bool isLoading = false;

  Future<void> analyzeWithAI() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await ApiService.analyzeFood(
        ocrText: widget.extractedText,

        age: currentUser.age,

        gender: currentUser.gender,

        height: currentUser.height,

        weight: currentUser.weight,

        medicalConditions: [
          if (currentUser.diabetes) "Diabetes",
          if (currentUser.hypertension) "Hypertension",
          if (currentUser.cholesterol) "High Cholesterol",
        ],

        allergies: currentUser.allergies,

        dietPreferences: [
          currentUser.dietPreference,
        ],
      );

      if (!mounted) return;

      final result = AnalysisResultModel.fromJson(response);
      final scan = ScanHistoryModel(
  id: const Uuid().v4(),

  productName:
      result.ingredients.isNotEmpty
          ? result.ingredients.first.name
          : "Unknown Product",

  ocrText: widget.extractedText,

  scannedAt: DateTime.now(),

  analysis: result,
);

ScanHistoryService.addScan(scan);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AnalysisScreen(
            result: result,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Error: $e",
          ),
        ),
      );
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen = Color(0xFF2E7D32);

    return Scaffold(
      appBar: AppBar(
        title: const Text("OCR Result"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Extracted Text",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: SelectableText(
                      widget.extractedText.isEmpty
                          ? "No text detected."
                          : widget.extractedText,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton.icon(
                  onPressed: isLoading ? null : analyzeWithAI,

                  icon: isLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.psychology),

                  label: Text(
                    isLoading
                        ? "Analyzing..."
                        : "Analyze with AI",
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}