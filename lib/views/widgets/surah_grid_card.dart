import 'package:flutter/material.dart';
import 'package:quran_app/models/surah_model.dart';

import 'package:google_fonts/google_fonts.dart';

class SurahGridCard extends StatelessWidget {
  final SurahModel surah;
  final VoidCallback onTap;

  const SurahGridCard({super.key, required this.surah, required this.onTap});

  @override
  Widget build(BuildContext context) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1B3A63), width: 1.2),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: const Color(0xFFF4B400),
            child: Text('${surah.number}',
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 12)),
          ),
          const SizedBox(height: 6),
          Text(
            surah.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.amiri(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Text(surah.englishName,
              maxLines: 1, overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 11, color: Colors.black87)),
          Text('${surah.numberOfAyahs} Ayahs',
              style: const TextStyle(fontSize: 9, color: Colors.grey)),
        ],
      ),
    ),
  );
}
}