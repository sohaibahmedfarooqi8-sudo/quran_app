import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/splash/splash_color.dart';
import '../controller/onboarding_controller.dart';

class OnboardingButton extends StatelessWidget {
  const OnboardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Obx(() {
      final isLast = controller.currentPage.value == controller.totalPages - 1;
      return SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          onPressed: controller.nextPage,
          style: ElevatedButton.styleFrom(
            backgroundColor: SplashColors.gold,
            foregroundColor: Colors.black, // dark text on gold = readable
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            elevation: 0,
          ),
          child: Text(
            isLast ? 'Get Started' : 'Continue',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      );
    });
  }
}
