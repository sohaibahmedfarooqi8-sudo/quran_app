import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quran_app/views/surah_list_view.dart';

// GetxController = a plain class GetX watches. RxInt (.obs) auto-notifies
// any Obx() widget that reads it — no setState needed anywhere.
class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;
  final int totalPages = 3;

  void onPageChanged(int index) => currentPage.value = index;

  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

 void _finishOnboarding() {
  Get.offAll(() => const SurahListView());
}

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
