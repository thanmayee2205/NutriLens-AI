import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends State<ForgotPasswordScreen> {

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  final TextEditingController _emailController =
      TextEditingController();

  @override
  void dispose() {

    _emailController.dispose();

    super.dispose();

  }

  void sendResetLink() {

    if (!_formKey.currentState!.validate()) {

      return;

    }

    showDialog(

      context: context,

      builder: (context) {

        return AlertDialog(

          title: const Text(
            "Password Reset",
          ),

          content: const Text(
            "A password reset link has been sent to your email.\n\nBackend integration will be added later.",
          ),

          actions: [

            TextButton(

              onPressed: () {

                Navigator.pop(context);

                Navigator.pop(context);

              },

              child: const Text(
                "OK",
              ),

            )

          ],

        );

      },

    );

  }

  @override
  Widget build(BuildContext context) {

    const Color primaryGreen = Color(0xFF2E7D32);

    return Scaffold(

      backgroundColor: const Color(0xFFF7F9F8),

      appBar: AppBar(
        title: const Text(
          "Forgot Password",
        ),
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          padding: const EdgeInsets.symmetric(horizontal: 28),

          child: Form(

            key: _formKey,

            child: Column(

              children: [

                const SizedBox(height: 40),

                Container(

                  width: 90,

                  height: 90,

                  decoration: const BoxDecoration(

                    color: primaryGreen,

                    shape: BoxShape.circle,

                  ),

                  child: const Icon(

                    Icons.lock_reset,

                    color: Colors.white,

                    size: 48,

                  ),

                ),

                const SizedBox(height: 30),

                const Text(

                  "Forgot Password?",

                  style: TextStyle(

                    fontSize: 28,

                    fontWeight: FontWeight.bold,

                  ),

                ),

                const SizedBox(height: 10),

                const Text(

                  "Enter your registered email address.\nWe'll send you a reset link.",

                  textAlign: TextAlign.center,

                  style: TextStyle(

                    color: Colors.grey,

                    fontSize: 16,

                  ),

                ),

                const SizedBox(height: 40),

                TextFormField(

                  controller: _emailController,

                  keyboardType:
                      TextInputType.emailAddress,

                  decoration: InputDecoration(

                    labelText: "Email",

                    prefixIcon:
                        const Icon(Icons.email_outlined),

                    border: OutlineInputBorder(

                      borderRadius:
                          BorderRadius.circular(14),

                    ),

                  ),

                  validator: (value) {

                    if (value == null ||
                        value.trim().isEmpty) {

                      return "Please enter your email";

                    }

                    if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+',
                    ).hasMatch(value)) {

                      return "Enter a valid email";

                    }

                    return null;

                  },

                ),

                const SizedBox(height: 30),
                                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: sendResetLink,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "SEND RESET LINK",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                OutlinedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                  label: const Text(
                    "Back to Login",
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(
                      double.infinity,
                      55,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
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