import 'package:flutter/material.dart';

import '../../core/data/app_data.dart';
import '../../services/user_service.dart';
import '../dashboard/dashboard_screen.dart';

class DietPreferencesScreen extends StatefulWidget {
  const DietPreferencesScreen({super.key});

  @override
  State<DietPreferencesScreen> createState() =>
      _DietPreferencesScreenState();
}

class _DietPreferencesScreenState
    extends State<DietPreferencesScreen> {

  String dietPreference =
      currentUser.dietPreference;

  final List<String> diets = [

    "No Preference",

    "Vegetarian",

    "Vegan",

    "Keto",

    "Paleo",

    "Mediterranean",

    "Low Carb",

    "High Protein",

    "Gluten Free",

    "Dairy Free",

  ];

  Future<void> finishProfile() async {

    currentUser.dietPreference =
        dietPreference;

    await UserService.saveUser({

      "fullName": currentUser.fullName,

      "age": currentUser.age,

      "gender": currentUser.gender,

      "height": currentUser.height,

      "weight": currentUser.weight,

      "activityLevel":
          currentUser.activityLevel,

      "diabetes":
          currentUser.diabetes,

      "hypertension":
          currentUser.hypertension,

      "cholesterol":
          currentUser.cholesterol,

      "allergies":
          currentUser.allergies,

      "dietPreference":
          currentUser.dietPreference,

    });

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(
          "Health Profile Saved Successfully!",
        ),

      ),

    );

    Navigator.pushAndRemoveUntil(

      context,

      MaterialPageRoute(

        builder: (_) =>
            const DashboardScreen(),

      ),

      (route) => false,

    );

  }

  @override
  Widget build(BuildContext context) {

    const primaryGreen =
        Color(0xFF2E7D32);

    return Scaffold(

      appBar: AppBar(
        title: const Text("Health Profile"),
      ),

      body: SafeArea(

        child: Padding(

          padding:
              const EdgeInsets.all(24),

          child: Column(

            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              const SizedBox(height: 10),

              const Text(
                "Step 5 of 5",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Diet Preference",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Choose the diet that best describes you.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              DropdownButtonFormField<String>(
                value: dietPreference,
                                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                ),

                items: diets.map((diet) {
                  return DropdownMenuItem(
                    value: diet,
                    child: Text(diet),
                  );
                }).toList(),

                onChanged: (value) {
                  setState(() {
                    dietPreference = value!;
                  });
                },

              ),

              const Spacer(),

              SizedBox(

                width: double.infinity,

                height: 55,

                child: ElevatedButton(

                  onPressed: () async {
                    await finishProfile();
                  },

                  style: ElevatedButton.styleFrom(

                    backgroundColor:
                        primaryGreen,

                    foregroundColor:
                        Colors.white,

                  ),

                  child: const Text(

                    "SAVE PROFILE",

                    style: TextStyle(

                      fontWeight:
                          FontWeight.bold,

                      letterSpacing: 1,

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