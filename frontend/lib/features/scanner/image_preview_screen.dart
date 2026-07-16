import 'dart:io';

import 'package:flutter/material.dart';

import '../../services/ocr_service.dart';
import 'ocr_result_screen.dart';

class ImagePreviewScreen extends StatefulWidget {
  final String imagePath;

  const ImagePreviewScreen({
    super.key,
    required this.imagePath,
  });

  @override
  State<ImagePreviewScreen> createState() =>
      _ImagePreviewScreenState();
}

class _ImagePreviewScreenState
    extends State<ImagePreviewScreen> {

  bool isLoading = false;

  Future<void> analyzeImage() async {

    setState(() {
      isLoading = true;
    });

    try {

      final extractedText =
          await OCRService.extractText(
        widget.imagePath,
      );

      if (!mounted) return;

      Navigator.push(

        context,

        MaterialPageRoute(

          builder: (_) => OCRResultScreen(
            extractedText: extractedText,
          ),

        ),

      );

    } catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(
          content: Text(
            "OCR failed: $e",
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

    const primaryGreen = Color(0xFF2E7D32);

    return Scaffold(

      appBar: AppBar(
        title: const Text("Preview"),
      ),

      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.all(20),

          child: Column(

            children: [

              const SizedBox(height: 10),

              const Text(
                "Image Preview",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(

                child: ClipRRect(

                  borderRadius:
                      BorderRadius.circular(18),

                  child: Image.file(
                    File(widget.imagePath),
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),

                ),

              ),

              const SizedBox(height: 25),

              SizedBox(

                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(

                  onPressed:
                      isLoading ? null : analyzeImage,

                  icon: isLoading
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child:
                              CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(
                          Icons.analytics_outlined,
                        ),

                  label: Text(
                    isLoading
                        ? "Extracting Text..."
                        : "Analyze Ingredients",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14),
                    ),
                  ),

                ),

              ),

              const SizedBox(height: 15),

              SizedBox(

                width: double.infinity,
                height: 55,

                child: OutlinedButton.icon(

                  onPressed: () {
                    Navigator.pop(context);
                  },

                  icon: const Icon(
                    Icons.camera_alt_outlined,
                  ),

                  label: const Text(
                    "Choose Another Image",
                  ),

                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryGreen,
                    side: const BorderSide(
                      color: primaryGreen,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14),
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