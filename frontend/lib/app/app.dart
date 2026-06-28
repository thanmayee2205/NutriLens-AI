import 'package:flutter/material.dart';
import '../features/splash/splash_screen.dart';

class NutriLensApp extends StatelessWidget {
  const NutriLensApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriLens AI',
      home: const SplashScreen(),
    );
  }
}