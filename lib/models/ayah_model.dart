class AyahModel {
  final int numberInSurah;
  final String text; // Arabic (Uthmani script)

  AyahModel({required this.numberInSurah, required this.text});

  factory AyahModel.fromJson(Map<String, dynamic> json) {
    return AyahModel(
      numberInSurah: json['numberInSurah'],
      text: json['text'],
    );
  }
}