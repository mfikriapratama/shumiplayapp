import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShumiColors {
  static const primary = Color(0xFF4DA6FF);
  static const secondary = Color(0xFFFF7A45);
  static const accent = Color(0xFFFFD634);
  static const background = Color(0xFFF9F8F4);
  static const white = Color(0xFFFFFFFF);
  static const textDark = Color(0xFF1A1A2E);
  static const textLight = Color(0xFF6B7280);
  static const correct = Color(0xFF4CAF50);
  static const incorrect = Color(0xFFE53935);
}

class ShumiTheme {
  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ShumiColors.primary,
          primary: ShumiColors.primary,
          secondary: ShumiColors.secondary,
          surface: ShumiColors.background,
        ),
        scaffoldBackgroundColor: ShumiColors.background,
        textTheme: GoogleFonts.notoSansJpTextTheme().copyWith(
          headlineLarge: GoogleFonts.notoSansJp(
            fontSize: 32, fontWeight: FontWeight.bold, color: ShumiColors.textDark),
          headlineMedium: GoogleFonts.notoSansJp(
            fontSize: 24, fontWeight: FontWeight.bold, color: ShumiColors.textDark),
          bodyLarge: GoogleFonts.notoSansJp(
            fontSize: 18, color: ShumiColors.textDark),
          bodyMedium: GoogleFonts.notoSansJp(
            fontSize: 16, color: ShumiColors.textDark),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ShumiColors.primary,
            foregroundColor: ShumiColors.white,
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            textStyle: GoogleFonts.notoSansJp(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      );
}
