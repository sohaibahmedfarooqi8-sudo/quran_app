import 'package:flutter/material.dart';

/// Centralized colors for the Splash feature.
///
/// WHY: hardcoding Color(0xFF...) inside every widget means changing
/// the theme later = hunting through 5 files. One source of truth here
/// means you change it once and it updates everywhere.
class SplashColors {
  SplashColors._(); // prevents accidental instantiation

  static const Color background = Color(0xFF000000);
  static const Color gold = Color(0xFFF2B705);
  static const Color goldSoft = Color(0xFFE0A93B);
  static const Color white = Color(0xFFFFFFFF);
  static const Color subtitle = Color(0xFFB9B9B9);
  static const Color trackGrey = Color(0xFF262626);
}
