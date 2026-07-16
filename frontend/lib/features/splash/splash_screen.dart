import 'package:flutter/material.dart';

import '../../core/data/app_data.dart';
import '../../services/auth_service.dart';
import '../../services/user_service.dart';
import '../dashboard/dashboard_screen.dart';
import '../onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {

    await Future.delayed(
      const Duration(seconds: 2),
    );

    final loggedIn =
        await AuthService.isLoggedIn();

    if (loggedIn) {

      final user =
          await UserService.loadUser();

      if (user != null) {

        currentUser.fullName =
            user["fullName"] ?? "";

        currentUser.age =
            user["age"] ?? 0;

        currentUser.gender =
            user["gender"] ?? "Female";

        currentUser.height =
            (user["height"] ?? 0)
                .toDouble();

        currentUser.weight =
            (user["weight"] ?? 0)
                .toDouble();

        currentUser.activityLevel =
            user["activityLevel"] ??
                "Moderately Active";

        currentUser.diabetes =
            user["diabetes"] ?? false;

        currentUser.hypertension =
            user["hypertension"] ??
                false;

        currentUser.cholesterol =
            user["cholesterol"] ??
                false;

        currentUser.allergies =
            List<String>.from(
          user["allergies"] ?? [],
        );

        currentUser.dietPreference =
            user["dietPreference"] ??
                "No Preference";
      }

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) =>
              const DashboardScreen(),
        ),
      );

      return;
    }
        if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const OnboardingScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: const Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [

            Icon(
              Icons.restaurant_menu,
              size: 100,
              color: Colors.white,
            ),

            SizedBox(height: 20),

            Text(
              "NutriLens AI",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 12),

            Text(
              "AI Powered Food Intelligence",
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),

            SizedBox(height: 40),

            CircularProgressIndicator(
              color: Colors.white,
            ),

          ],
        ),
      ),
    );
  }
}