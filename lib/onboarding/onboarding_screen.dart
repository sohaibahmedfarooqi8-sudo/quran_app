import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../splash/splash_color.dart';
import 'controller/onboarding_controller.dart';
import 'widgets/onboarding_button.dart';
import 'widgets/onboarding_dots.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const List<String> _bgImages = [
    'asset/images/onboarding1.png',
    'asset/images/onboarding2.png',
    'asset/images/onboarding3.png',
  ];

  // BoxFit.cover crops the image to fill the screen; `alignment` picks
  // WHICH part stays visible. A positive y shifts the visible window
  // down, cropping more off the top — that's what removes the empty
  // gap on 1 & 2. Image 3 was already framed correctly, so it stays
  // // centered.
  // static const List<Alignment> _bgAlignments = [
  //   Alignment(0, 0.15),
  //   Alignment(0, 0.15),
  //   Alignment.center,
  // ];

  @override
  Widget build(BuildContext context) {
    // Get.put creates the controller once; Get.find (used inside the
    // dot/button widgets) fetches that same instance — no passing it
    // down through constructors.
    final controller = Get.put(OnboardingController());

    return Scaffold(
      backgroundColor: SplashColors.background,
      body: Stack(
        children: [
          // Each background PNG already has its own title/subtitle baked
          // in, so we just swap full-bleed images — no text overlay
          // needed here (unlike the splash screen).
          PageView.builder(
            controller: controller.pageController,
            itemCount: _bgImages.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              return Image.asset(
                _bgImages[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              );
            },
          ),

          // Dots + Continue button pinned to the bottom, same spot as
          // the VR reference.
          Positioned(
            left: 24,
            right: 24,
            bottom: 40,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                OnboardingDots(),
                SizedBox(height: 20),
                OnboardingButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
