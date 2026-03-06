import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color primary = Color(0xFF8B1A1A);
  static const Color primaryDark = Color(0xFF5C0F0F);
  static const Color primaryLight = Color(0xFFB22222);
  static const Color gold = Color(0xFFC8A84B);
  static const Color goldLight = Color(0xFFE8C870);
  static const Color surface = Color(0xFFF5F0EA);
  static const Color cardBg = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF1A0A0A);
  static const Color textSecondary = Color(0xFF6B5858);
  static const Color textLight = Color(0xFFF5F0EA);
  static const Color divider = Color(0xFFE0D5C5);
  static const LinearGradient headerGradient = LinearGradient(
    colors: [primaryDark, primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient bgGradient = LinearGradient(
    colors: [Color(0xFFFFFFFF), Color(0xFFF9F6F0), Color(0xFFFFFFFF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
