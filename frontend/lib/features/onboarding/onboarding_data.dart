import 'package:flutter/material.dart';

class OnboardingData {
  final IconData icon;
  final String title;
  final String description;

  const OnboardingData({
    required this.icon,
    required this.title,
    required this.description,
  });
}

final List<OnboardingData> onboardingPages = [
  const OnboardingData(
    icon: Icons.camera_alt,
    title: "Scan Food Labels",
    description:
        "Capture or upload food labels and let AI extract all ingredients instantly.",
  ),
  const OnboardingData(
    icon: Icons.science,
    title: "Understand Ingredients",
    description:
        "Learn what preservatives, additives, allergens and chemicals actually mean.",
  ),
  const OnboardingData(
    icon: Icons.favorite,
    title: "Personalized Health Insights",
    description:
        "Receive recommendations based on your health profile and dietary needs.",
  ),
];