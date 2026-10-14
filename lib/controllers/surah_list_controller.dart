import 'package:get/get.dart';
import '../models/surah_model.dart';
import '../services/quran_service.dart';

class SurahListController extends GetxController {
  final QuranService _service = QuranService();

  var isLoading = true.obs;
  var hasError = false.obs;
  var surahs = <SurahModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadSurahs();
  }

  Future<void> loadSurahs() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      surahs.value = await _service.fetchFirstTenSurahs();
    } catch (_) {
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}