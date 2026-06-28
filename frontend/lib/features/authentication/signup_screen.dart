import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool obscurePassword = true;

  bool obscureConfirmPassword = true;

  bool agreeTerms = false;

  @override
  void dispose() {

    _nameController.dispose();

    _emailController.dispose();

    _passwordController.dispose();

    _confirmPasswordController.dispose();

    super.dispose();

  }

  void signup() {

    if (!_formKey.currentState!.validate()) {

      return;

    }

    if (!agreeTerms) {

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(

          content: Text(
            "Please accept Terms & Conditions",
          ),

        ),

      );

      return;

    }

    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(
          "Account Created Successfully (Backend will be connected later)",
        ),

      ),

    );

  }

  @override
  Widget build(BuildContext context) {

    const Color primaryGreen = Color(0xFF2E7D32);

    return Scaffold(

      backgroundColor: const Color(0xFFF7F9F8),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.symmetric(horizontal: 28),

          child: Form(

            key: _formKey,

            child: Column(

              children: [

                const SizedBox(height: 35),

                Container(

                  width: 95,

                  height: 95,

                  decoration: const BoxDecoration(

                    color: primaryGreen,

                    shape: BoxShape.circle,

                  ),

                  child: const Icon(

                    Icons.person_add,

                    size: 50,

                    color: Colors.white,

                  ),

                ),

                const SizedBox(height: 25),

                const Text(

                  "Create Account",

                  style: TextStyle(

                    fontSize: 30,

                    fontWeight: FontWeight.bold,

                  ),

                ),

                const SizedBox(height: 10),

                const Text(

                  "Join NutriLens AI and start eating healthier.",

                  textAlign: TextAlign.center,

                  style: TextStyle(

                    fontSize: 16,

                    color: Colors.grey,

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

                  controller: _emailController,

                  keyboardType: TextInputType.emailAddress,

                  decoration: InputDecoration(

                    labelText: "Email",

                    prefixIcon: const Icon(Icons.email_outlined),

                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(14),

                    ),

                  ),

                  validator: (value) {

                    if (value == null || value.isEmpty) {

                      return "Email is required";

                    }

                    if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+',
                    ).hasMatch(value)) {

                      return "Enter a valid email";

                    }

                    return null;

                  },

                ),

                const SizedBox(height: 20),
                                TextFormField(

                  controller: _passwordController,

                  obscureText: obscurePassword,

                  decoration: InputDecoration(

                    labelText: "Password",

                    prefixIcon: const Icon(Icons.lock_outline),

                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(14),

                    ),

                    suffixIcon: IconButton(

                      icon: Icon(

                        obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,

                      ),

                      onPressed: () {

                        setState(() {

                          obscurePassword =
                              !obscurePassword;

                        });

                      },

                    ),

                  ),

                  validator: (value) {

                    if (value == null || value.isEmpty) {

                      return "Password is required";

                    }

                    if (value.length < 6) {

                      return "Minimum 6 characters required";

                    }

                    return null;

                  },

                ),

                const SizedBox(height: 20),

                TextFormField(

                  controller: _confirmPasswordController,

                  obscureText: obscureConfirmPassword,

                  decoration: InputDecoration(

                    labelText: "Confirm Password",

                    prefixIcon:
                        const Icon(Icons.lock_reset),

                    border: OutlineInputBorder(

                      borderRadius:
                          BorderRadius.circular(14),

                    ),

                    suffixIcon: IconButton(

                      icon: Icon(

                        obscureConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,

                      ),

                      onPressed: () {

                        setState(() {

                          obscureConfirmPassword =
                              !obscureConfirmPassword;

                        });

                      },

                    ),

                  ),

                  validator: (value) {

                    if (value == null || value.isEmpty) {

                      return "Please confirm password";

                    }

                    if (value !=
                        _passwordController.text) {

                      return "Passwords do not match";

                    }

                    return null;

                  },

                ),

                const SizedBox(height: 20),

                Row(

                  children: [

                    Checkbox(

                      value: agreeTerms,

                      activeColor: primaryGreen,

                      onChanged: (value) {

                        setState(() {

                          agreeTerms = value!;

                        });

                      },

                    ),

                    const Expanded(

                      child: Text(

                        "I agree to the Terms & Conditions",

                      ),

                    ),

                  ],

                ),

                const SizedBox(height: 20),

                SizedBox(

                  width: double.infinity,

                  height: 55,

                  child: ElevatedButton(

                    onPressed: signup,

                    style: ElevatedButton.styleFrom(

                      backgroundColor: primaryGreen,

                      foregroundColor: Colors.white,

                      shape: RoundedRectangleBorder(

                        borderRadius:
                            BorderRadius.circular(14),

                      ),

                    ),

                    child: const Text(

                      "CREATE ACCOUNT",

                      style: TextStyle(

                        letterSpacing: 1,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ),

                ),

                const SizedBox(height: 25),
                                Row(
                  children: const [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text("OR"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),

                const SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Google Sign-In will be implemented later",
                          ),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.g_mobiledata,
                      size: 32,
                    ),
                    label: const Text(
                      "Continue with Google",
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Login",
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}