import 'package:flutter/material.dart';

import '../../services/auth_service.dart';
import '../dashboard/dashboard_screen.dart';
import 'forgot_password_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() =>
      _LoginScreenState();
}

class _LoginScreenState
    extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  final TextEditingController
      _emailController =
      TextEditingController();

  final TextEditingController
      _passwordController =
      TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final success = await AuthService.login(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );

    if (!mounted) return;

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Invalid email or password",
          ),
        ),
      );
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const DashboardScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryGreen =
        Color(0xFF2E7D32);

    return Scaffold(
      backgroundColor:
          const Color(0xFFF7F9F8),

      body: SafeArea(
        child: SingleChildScrollView(
          padding:
              const EdgeInsets.symmetric(
            horizontal: 28,
          ),

          child: Form(
            key: _formKey,

            child: Column(
              children: [

                const SizedBox(height: 40),

                Container(
                  width: 100,
                  height: 100,

                  decoration:
                      const BoxDecoration(
                    color: primaryGreen,
                    shape: BoxShape.circle,
                  ),

                  child: const Icon(
                    Icons.restaurant_menu,
                    color: Colors.white,
                    size: 50,
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Login to continue your healthy journey",
                  textAlign:
                      TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 40),

                TextFormField(
                  controller:
                      _emailController,
                  keyboardType:
                      TextInputType
                          .emailAddress,

                  decoration:
                      InputDecoration(
                    labelText: "Email",

                    prefixIcon:
                        const Icon(
                      Icons.email_outlined,
                    ),

                    border:
                        OutlineInputBorder(
                      borderRadius:
                          BorderRadius
                              .circular(
                                  14),
                    ),
                  ),

                  validator: (value) {
                    if (value == null ||
                        value
                            .trim()
                            .isEmpty) {
                      return "Please enter your email";
                    }

                    if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+',
                    ).hasMatch(value)) {
                      return "Please enter a valid email";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller:
                      _passwordController,

                  obscureText:
                      _obscurePassword,

                  decoration:
                      InputDecoration(
                                            labelText: "Password",

                    prefixIcon: const Icon(
                      Icons.lock_outline,
                    ),

                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(14),
                    ),

                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),

                      onPressed: () {
                        setState(() {
                          _obscurePassword =
                              !_obscurePassword;
                        });
                      },
                    ),
                  ),

                  validator: (value) {
                    if (value == null ||
                        value.isEmpty) {
                      return "Please enter your password";
                    }

                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }

                    return null;
                  },
                ),

                const SizedBox(height: 10),

                Row(
                  children: [

                    Checkbox(
                      value: _rememberMe,
                      activeColor: primaryGreen,

                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),

                    const Text("Remember Me"),

                    const Spacer(),

                    TextButton(
                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const ForgotPasswordScreen(),
                          ),
                        );

                      },

                      child: const Text(
                        "Forgot Password?",
                      ),
                    ),

                  ],
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(

                    onPressed: () async {
                      await login();
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryGreen,
                      foregroundColor: Colors.white,

                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(14),
                      ),
                    ),

                    child: const Text(
                      "LOGIN",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: const [

                    Expanded(
                      child: Divider(),
                    ),

                    Padding(
                      padding:
                          EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      child: Text("OR"),
                    ),

                    Expanded(
                      child: Divider(),
                    ),

                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: OutlinedButton.icon(

                    onPressed: () {

                      ScaffoldMessenger.of(context)
                          .showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Google Sign-In will be implemented later",
                          ),
                        ),
                      );

                    },

                    icon: const Icon(
                      Icons.g_mobiledata,
                      size: 34,
                    ),

                    label: const Text(
                      "Continue with Google",
                    ),
                  ),
                ),

                const SizedBox(height: 35),
                                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,

                  children: [

                    const Text(
                      "Don't have an account?",
                    ),

                    TextButton(

                      onPressed: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const SignupScreen(),
                          ),
                        );

                      },

                      child: const Text(
                        "Sign Up",
                      ),

                    ),

                  ],
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