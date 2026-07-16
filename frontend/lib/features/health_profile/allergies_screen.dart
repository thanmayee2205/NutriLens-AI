import 'package:flutter/material.dart';

import '../../core/data/app_data.dart';
import 'diet_preferences_screen.dart';

class AllergiesScreen extends StatefulWidget {
  const AllergiesScreen({super.key});

  @override
  State<AllergiesScreen> createState() =>
      _AllergiesScreenState();
}

class _AllergiesScreenState
    extends State<AllergiesScreen> {

  final List<String> selectedAllergies = [];

  final List<String> allergyOptions = [

    "Milk",

    "Egg",

    "Peanuts",

    "Tree Nuts",

    "Soy",

    "Wheat",

    "Fish",

    "Shellfish",

    "Sesame",

    "Gluten",

  ];

  void continueNext() {

    currentUser.allergies = selectedAllergies;

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (_) =>
            const DietPreferencesScreen(),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    const primaryGreen = Color(0xFF2E7D32);

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Health Profile",
        ),
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
                "Step 4 of 5",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Food Allergies",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Select all allergies that apply.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: allergyOptions.length,
                  itemBuilder: (context, index) {
                                        final allergy =
                        allergyOptions[index];

                    return CheckboxListTile(

                      value: selectedAllergies
                          .contains(allergy),

                      title: Text(allergy),

                      activeColor: primaryGreen,

                      onChanged: (value) {

                        setState(() {

                          if (value!) {

                            selectedAllergies
                                .add(allergy);

                          } else {

                            selectedAllergies
                                .remove(allergy);

                          }

                        });

                      },

                    );

                  },

                ),

              ),

              const SizedBox(height: 20),

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