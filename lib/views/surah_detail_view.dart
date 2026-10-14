import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/surah_detail_controller.dart';

class SurahDetailView extends StatelessWidget {
  final int surahNumber;
  final String title;

  const SurahDetailView({super.key, required this.surahNumber, required this.title});

  static const double fontSize = 24;
  static const double lineHeight = 2.3;
  static const double lineSpacing = fontSize * lineHeight; // px between ruled lines

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      SurahDetailController(surahNumber),
      tag: '$surahNumber',
    );

    return Scaffold(
      backgroundColor: const Color(0xFFFDF8EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B3A63),
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            onTap: () => Get.back(),
            borderRadius: BorderRadius.circular(50),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.2),
              ),
              child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
            ),
          ),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20,color:Colors.white,)),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.hasError.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Failed to load ayahs.'),
                const SizedBox(height: 12),
                ElevatedButton(onPressed: controller.loadAyahs, child: const Text('Retry')),
              ],
            ),
          );
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 8, offset: const Offset(0, 3))],
            ),
            child: CustomPaint(
              foregroundPainter: RuledLinesPainter(lineSpacing: lineSpacing),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Text.rich(
                  TextSpan(
                    children: controller.ayahs.expand((ayah) {
                      return [
                        TextSpan(text: '${ayah.text} '),
                        WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(colors: [Color(0xFFF4B400), Color(0xFFE09900)]),
                            ),
                            alignment: Alignment.center,
                            child: Text('${ayah.numberInSurah}',
                                style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ];
                    }).toList(),
                  ),
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.amiri(fontSize: fontSize, height: lineHeight, color: const Color(0xFF1B3A63)),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

// Draws a faint horizontal rule under every text line, notebook-style
class RuledLinesPainter extends CustomPainter {
  final double lineSpacing;
  RuledLinesPainter({required this.lineSpacing});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1B3A63).withValues(alpha: 0.15)
      ..strokeWidth = 1;

    double y = lineSpacing; // first line's baseline area
    while (y < size.height) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
      y += lineSpacing;
    }
  }

  @override
  bool shouldRepaint(covariant RuledLinesPainter oldDelegate) => false;
}