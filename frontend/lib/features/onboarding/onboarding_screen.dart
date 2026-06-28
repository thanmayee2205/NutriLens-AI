import 'package:flutter/material.dart';
import '../authentication/login_screen.dart';

import 'onboarding_data.dart';
import 'onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final PageController _pageController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {

    bool isLastPage = currentPage == onboardingPages.length - 1;

    return Scaffold(

      body: SafeArea(

        child: Column(

          children: [

            Align(
              alignment: Alignment.centerRight,

              child: TextButton(

                onPressed: () {

                },

                child: const Text("Skip"),

              ),

            ),

            Expanded(

              child: PageView.builder(

                controller: _pageController,

                itemCount: onboardingPages.length,

                onPageChanged: (index) {

                  setState(() {
                    currentPage = index;
                  });

                },

                itemBuilder: (context, index) {

                  return OnboardingPage(
                    data: onboardingPages[index],
                  );

                },

              ),

            ),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              children: List.generate(

                onboardingPages.length,

                (index) => Container(

                  margin: const EdgeInsets.all(4),

                  width: currentPage == index ? 20 : 8,

                  height: 8,

                  decoration: BoxDecoration(

                    color: currentPage == index
                        ? Colors.green
                        : Colors.grey,

                    borderRadius: BorderRadius.circular(20),

                  ),

                ),

              ),

            ),

            const SizedBox(height: 30),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal: 24),

              child: SizedBox(

                width: double.infinity,

                height: 55,

                child: ElevatedButton(

                  onPressed: () {

                    if (isLastPage) {

                      Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (_) => const LoginScreen(),
  ),
);

                    } else {

                      _pageController.nextPage(

                        duration: const Duration(milliseconds: 300),

                        curve: Curves.ease,

                      );

                    }

                  },

                  child: Text(
                    isLastPage
                        ? "Get Started"
                        : "Next",
                  ),

                ),

              ),

            ),

            const SizedBox(height: 30),

          ],

        ),

      ),

    );

  }

}