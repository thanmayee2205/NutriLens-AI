import 'package:flutter/material.dart';

import '../../core/data/app_data.dart';
import 'allergies_screen.dart';

class MedicalConditionsScreen extends StatefulWidget {
  const MedicalConditionsScreen({super.key});

  @override
  State<MedicalConditionsScreen> createState() =>
      _MedicalConditionsScreenState();
}

class _MedicalConditionsScreenState
    extends State<MedicalConditionsScreen> {

  bool diabetes = currentUser.diabetes;
  bool hypertension = currentUser.hypertension;
  bool cholesterol = currentUser.cholesterol;

  void continueNext() {

    currentUser.diabetes = diabetes;
    currentUser.hypertension = hypertension;
    currentUser.cholesterol = cholesterol;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AllergiesScreen(),
      ),
    );

  }

  @override
  Widget build(BuildContext context) {

    const primaryGreen = Color(0xFF2E7D32);

    return Scaffold(

      appBar: AppBar(
        title: const Text("Health Profile"),
      ),

      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.all(24),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 10),

              const Text(
                "Step 3 of 5",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Medical Conditions",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Select all that apply.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 35),
                            CheckboxListTile(

                value: diabetes,

                title: const Text("Diabetes"),

                activeColor: primaryGreen,

                onChanged: (value) {

                  setState(() {

                    diabetes = value!;

                  });

                },

              ),

              CheckboxListTile(

                value: hypertension,

                title: const Text("Hypertension"),

                activeColor: primaryGreen,

                onChanged: (value) {

                  setState(() {

                    hypertension = value!;

                  });

                },

              ),

              CheckboxListTile(

                value: cholesterol,

                title: const Text("High Cholesterol"),

                activeColor: primaryGreen,

                onChanged: (value) {

                  setState(() {

                    cholesterol = value!;

                  });

                },

              ),

              const Spacer(),

              SizedBox(

                width: double.infinity,

                height: 55,

                child: ElevatedButton(

                  onPressed: continueNext,

                  style: ElevatedButton.styleFrom(

                    backgroundColor: primaryGreen,

                    foregroundColor: Colors.white,

                  ),

                  child: const Text(
                    "CONTINUE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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