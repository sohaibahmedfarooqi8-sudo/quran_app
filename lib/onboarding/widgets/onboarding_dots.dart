import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/splash/splash_color.dart';
import '../controller/onboarding_controller.dart';
// Active dot stretches into a pill (like the VR reference), inactive
// dots stay small grey circles. Obx() rebuilds ONLY this widget when
// currentPage changes — not the whole screen.
class OnboardingDots extends StatelessWidget {
  const OnboardingDots({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Obx(() {
      final active = controller.currentPage.value;
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(controller.totalPages, (index) {
          final isActive = index == active;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: isActive ? 24 : 8,
            decoration: BoxDecoration(
              color: isActive ? SplashColors.gold : SplashColors.trackGrey,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        }),
      );
    });
  }
}
