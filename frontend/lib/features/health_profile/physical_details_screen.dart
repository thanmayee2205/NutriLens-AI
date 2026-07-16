import 'package:flutter/material.dart';

import '../../core/data/app_data.dart';
import 'medical_conditions_screen.dart';

class PhysicalDetailsScreen extends StatefulWidget {
  const PhysicalDetailsScreen({super.key});

  @override
  State<PhysicalDetailsScreen> createState() =>
      _PhysicalDetailsScreenState();
}

class _PhysicalDetailsScreenState
    extends State<PhysicalDetailsScreen> {

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  final TextEditingController _heightController =
      TextEditingController();

  final TextEditingController _weightController =
      TextEditingController();

  String activityLevel =
      "Moderately Active";

  @override
  void initState() {

    super.initState();

    _heightController.text =
        currentUser.height.toString();

    _weightController.text =
        currentUser.weight.toString();

    activityLevel =
        currentUser.activityLevel;

  }

  @override
  void dispose() {

    _heightController.dispose();

    _weightController.dispose();

    super.dispose();

  }

  void continueNext() {

    if (!_formKey.currentState!.validate()) {

      return;

    }

    currentUser.height =
        double.parse(_heightController.text);

    currentUser.weight =
        double.parse(_weightController.text);

    currentUser.activityLevel =
        activityLevel;

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (_) =>
            const MedicalConditionsScreen(),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    const Color primaryGreen =
        Color(0xFF2E7D32);

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Health Profile",
        ),

      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding:
              const EdgeInsets.all(24),

          child: Form(

            key: _formKey,

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                const SizedBox(height: 10),

                const Text(

                  "Step 2 of 5",

                  style: TextStyle(
                    color: Colors.grey,
                  ),

                ),

                const SizedBox(height: 10),

                const Text(

                  "Physical Details",

                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),

                ),

                const SizedBox(height: 8),

                const Text(

                  "Help us personalize your nutrition recommendations.",

                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),

                ),

                const SizedBox(height: 35),
                                TextFormField(
                  controller: _heightController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: "Height (cm)",
                    prefixIcon: const Icon(Icons.height),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your height";
                    }

                    final height = double.tryParse(value);

                    if (height == null) {
                      return "Enter a valid height";
                    }

                    if (height < 50 || height > 250) {
                      return "Height should be between 50 and 250 cm";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _weightController,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    labelText: "Weight (kg)",
                    prefixIcon: const Icon(Icons.monitor_weight_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your weight";
                    }

                    final weight = double.tryParse(value);

                    if (weight == null) {
                      return "Enter a valid weight";
                    }

                    if (weight < 20 || weight > 300) {
                      return "Weight should be between 20 and 300 kg";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 25),

                const Text(
                  "Activity Level",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                DropdownButtonFormField<String>(
                  value: activityLevel,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: "Sedentary",
                      child: Text("Sedentary"),
                    ),
                    DropdownMenuItem(
                      value: "Lightly Active",
                      child: Text("Lightly Active"),
                    ),
                    DropdownMenuItem(
                      value: "Moderately Active",
                      child: Text("Moderately Active"),
                    ),
                    DropdownMenuItem(
                      value: "Very Active",
                      child: Text("Very Active"),
                    ),
                    DropdownMenuItem(
                      value: "Athlete",
                      child: Text("Athlete"),
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      activityLevel = value!;
                    });
                  },
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: continueNext,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "CONTINUE",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

              ],
            ),
          ),
        ),
      ),
    );
  }
}