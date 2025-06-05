import 'package:flutter/material.dart';

class AppColors {
  // Pastel gradient background
  static const backgroundGradientStart = Color(0xFFFDFBFF); // light lavender
  static const backgroundGradientEnd = Color(0xFFEFF1F5);   // pale blue-gray

  // Primary UI Colors
  static const primary = Color(0xFF1F2933); // dark slate text
  static const accent = Color(0xFF7C3AED); // soft violet
  static const lightAccent = Color(0xFFD8B4FE); // soft lavender chips

  // Surfaces
  static const card = Colors.white;
  static const highlight = Color(0xFFF4F5F7);
  static const background = Color(0xFFF9FAFB);
  static const mutedText = Color(0xFF6B7280);
  static const cardShadow = Color(0x1A000000);
}

class AppTextStyles {
  static const headline = TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    height: 1.3,
  );

  static final sectionTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: AppColors.primary.withAlpha(220),
  );

  static final body = TextStyle(
    fontSize: 16,
    color: AppColors.mutedText,
    height: 1.6,
  );

  static final button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.accent.withAlpha(230),
  );
}

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: AppColors.accent,
    fontFamily: 'Roboto',
    textTheme: TextTheme(
      headlineLarge: AppTextStyles.headline,
      titleLarge: AppTextStyles.sectionTitle,
      bodyMedium: AppTextStyles.body,
      labelLarge: AppTextStyles.button,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: AppTextStyles.button,
        elevation: 3,
      ),
    ),
    cardTheme: CardTheme(
      color: AppColors.card,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      shadowColor: AppColors.cardShadow,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.accent,
        textStyle: AppTextStyles.button,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.accent, size: 24),
  );
}
