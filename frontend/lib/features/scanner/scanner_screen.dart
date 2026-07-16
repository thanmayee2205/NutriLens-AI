import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'image_preview_screen.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() =>
      _ScannerScreenState();
}

class _ScannerScreenState
    extends State<ScannerScreen> {

  final ImagePicker picker = ImagePicker();

  Future<void> pickFromCamera() async {

    final XFile? image =
        await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
    );

    if (image == null) return;

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (_) =>
            ImagePreviewScreen(
          imagePath: image.path,
        ),

      ),

    );

  }

  Future<void> pickFromGallery() async {

    final XFile? image =
        await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (image == null) return;

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (_) =>
            ImagePreviewScreen(
          imagePath: image.path,
        ),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    const primaryGreen =
        Color(0xFF2E7D32);

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Food Scanner",
        ),
      ),

      body: SafeArea(

        child: Padding(

          padding:
              const EdgeInsets.all(24),

          child: Column(

            children: [

              const SizedBox(height: 20),

              const Icon(
                Icons.document_scanner,
                size: 110,
                color: primaryGreen,
              ),

              const SizedBox(height: 30),

              const Text(
                "Scan a Food Label",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Capture a food label or choose one from your gallery.",
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 50),
                            SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: pickFromCamera,
                  icon: const Icon(Icons.camera_alt),
                  label: const Text(
                    "Scan with Camera",
                    style: TextStyle(
                      fontSize: 18,
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

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: OutlinedButton.icon(
                  onPressed: pickFromGallery,
                  icon: const Icon(Icons.photo_library),
                  label: const Text(
                    "Choose from Gallery",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: primaryGreen,
                    side: const BorderSide(
                      color: primaryGreen,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Icon(
                        Icons.lightbulb_outline,
                        color: Colors.amber,
                      ),

                      SizedBox(width: 12),

                      Expanded(
                        child: Text(
                          "Tip: Capture a clear image of the ingredients list for the most accurate analysis.",
                        ),
                      ),

                    ],
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