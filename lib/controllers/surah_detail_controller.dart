import 'package:get/get.dart';
import '../models/ayah_model.dart';
import '../services/quran_service.dart';

class SurahDetailController extends GetxController {
  final QuranService _service = QuranService();
  final int surahNumber;

  SurahDetailController(this.surahNumber);

  var isLoading = true.obs;
  var hasError = false.obs;
  var ayahs = <AyahModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAyahs();
  }

  Future<void> loadAyahs() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      ayahs.value = await _service.fetchSurahAyahs(surahNumber);
    } catch (_) {
      hasError.value = true;
    } finally {
      isLoading.value = false;
    }
  }
}