import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/surah_model.dart';
import '../models/ayah_model.dart';

class QuranService {
  static const String _base = 'https://api.alquran.cloud/v1';

  // Fetches surah 1-10 metadata (name, ayah count, etc.)
  Future<List<SurahModel>> fetchFirstTenSurahs() async {
  final res = await http.get(Uri.parse('$_base/surah'));
  if (res.statusCode != 200) throw Exception('Failed to load surah list');
  final List data = jsonDecode(res.body)['data'];
  return data.take(20).map((e) => SurahModel.fromJson(e)).toList(); // 10 -> 20
}

  // quran-uthmani = the correct, standard Arabic script edition
  Future<List<AyahModel>> fetchSurahAyahs(int surahNumber) async {
    final res = await http.get(
      Uri.parse('$_base/surah/$surahNumber/quran-uthmani'),
    );
    if (res.statusCode != 200) {
      throw Exception('Failed to load ayahs (${res.statusCode})');
    }
    final List data = jsonDecode(res.body)['data']['ayahs'];
    return data.map((e) => AyahModel.fromJson(e)).toList();
  }
}