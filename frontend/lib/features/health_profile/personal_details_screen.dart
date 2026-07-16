import 'package:flutter/material.dart';

import '../../core/data/app_data.dart';
import 'physical_details_screen.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() =>
      _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState
    extends State<PersonalDetailsScreen> {

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  final TextEditingController _nameController =
      TextEditingController();

  final TextEditingController _ageController =
      TextEditingController();

  String gender = "Female";

  @override
  void initState() {
    super.initState();

    _nameController.text = currentUser.fullName;

    if (currentUser.age != 0) {
      _ageController.text =
          currentUser.age.toString();
    }

    gender = currentUser.gender;
  }

  @override
  void dispose() {

    _nameController.dispose();

    _ageController.dispose();

    super.dispose();

  }

  void continueToNext() {

    if (!_formKey.currentState!.validate()) {
      return;
    }

    currentUser.fullName =
        _nameController.text.trim();

    currentUser.age =
        int.parse(_ageController.text);

    currentUser.gender = gender;

    Navigator.push(

      context,

      MaterialPageRoute(

        builder: (_) =>
            const PhysicalDetailsScreen(),

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

                  "Step 1 of 5",

                  style: TextStyle(

                    color: Colors.grey,

                  ),

                ),

                const SizedBox(height: 10),

                const Text(

                  "Personal Details",

                  style: TextStyle(

                    fontSize: 30,

                    fontWeight:
                        FontWeight.bold,

                  ),

                ),

                const SizedBox(height: 8),

                const Text(

                  "Tell us about yourself.",

                  style: TextStyle(

                    color: Colors.grey,

                    fontSize: 16,

                  ),

                ),

                const SizedBox(height: 35),
                                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your full name";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Age",
                    prefixIcon: const Icon(Icons.cake_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your age";
                    }

                    final age = int.tryParse(value);

                    if (age == null) {
                      return "Enter a valid age";
                    }

                    if (age < 1 || age > 120) {
                      return "Age must be between 1 and 120";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 25),

                const Text(
                  "Gender",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),

                const SizedBox(height: 10),

                RadioListTile<String>(
                  title: const Text("Female"),
                  value: "Female",
                  groupValue: gender,
                  activeColor: primaryGreen,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),

                RadioListTile<String>(
                  title: const Text("Male"),
                  value: "Male",
                  groupValue: gender,
                  activeColor: primaryGreen,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),

                RadioListTile<String>(
                  title: const Text("Other"),
                  value: "Other",
                  groupValue: gender,
                  activeColor: primaryGreen,
                  onChanged: (value) {
                    setState(() {
                      gender = value!;
                    });
                  },
                ),

                const SizedBox(height: 35),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: continueToNext,
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