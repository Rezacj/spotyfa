import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Private constructor to prevent instantiation

  // =============================================
  // 🎨 PRIMARY COLORS
  // =============================================
  static const Color primary = Color(0xFF1DB954);
  static const Color primaryLight = Color(0xFF1ED760);
  static const Color primaryDark = Color(0xFF1AA34A);
  static const Color primaryPressed = Color(0xFF169C46);

  // =============================================
  // 🎨 BACKGROUND COLORS
  // =============================================
  static const Color secondary = Color(0xFF121212); // Background اصلی
  static const Color tertiary = Color(0xFF181818); // سطح‌های بالاتر
  static const Color surface = Color(0xFF282828); // کارت‌ها
  static const Color elevated = Color(0xFF333333); // سطوح برجسته
  static const Color pressed = Color(0xFF3E3E3E); // حالت فشرده

  // =============================================
  // 🎨 TEXT COLORS
  // =============================================
  static const Color natural = Color(0xFFB3B3B3); // متن ثانویه
  static const Color textPrimary = Color(0xFFFFFFFF); // متن اصلی
  static const Color textSecondary = Color(0xFFB3B3B3); // متن ثانویه
  static const Color textTertiary = Color(0xFF808080); // متن کم‌اهمیت
  static const Color textDisabled = Color(0xFF4D4D4D); // متن غیرفعال

  // =============================================
  // 🎨 SEMANTIC COLORS
  // =============================================
  static const Color success = Color(0xFF1DB954);
  static const Color warning = Color(0xFFF39C12);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF3498DB);

  // =============================================
  // 🎨 OVERLAY COLORS
  // =============================================
  static const Color overlay = Color(0x80000000); // 50% black
  static const Color overlayLight = Color(0x40000000); // 25% black
  static const Color overlayLighter = Color(0x20000000); // 12.5% black
  static const Color scrim = Color(0xB3000000); // 70% black

  // =============================================
  // 🎨 PLAYER COLORS
  // =============================================
  static const Color seekBarBackground = Color(0xFF4D4D4D);
  static const Color seekBarProgress = Color(0xFF1DB954);
  static const Color seekBarThumb = Color(0xFFFFFFFF);
  static const Color volumeSliderBackground = Color(0xFF4D4D4D);
  static const Color volumeSliderProgress = Color(0xFF1DB954);

  // =============================================
  // 🎨 MINI PLAYER COLORS
  // =============================================
  static const Color miniPlayerBackground = Color(0xFF181818);
  static const Color miniPlayerDivider = Color(0xFF282828);

  // =============================================
  // 🎨 NAVIGATION COLORS
  // =============================================
  static const Color bottomNavBackground = Color(0xFF181818);
  static const Color bottomNavSelected = Color(0xFF1DB954);
  static const Color bottomNavUnselected = Color(0xFFB3B3B3);

  // =============================================
  // 🎨 GRADIENT COLORS
  // =============================================
  static const List<Color> albumArtGradient = [
    Color(0x00000000),
    Color(0xFF121212),
  ];

  static const List<Color> playerBackgroundGradient = [
    Color(0xFF282828),
    Color(0xFF121212),
  ];

  // =============================================
  // 🎨 SHADOW COLORS
  // =============================================
  static const Color shadowLight = Color(0x1A000000);
  static const Color shadowMedium = Color(0x33000000);
  static const Color shadowHeavy = Color(0x4D000000);

  // =============================================
  // 🎨 MISC
  // =============================================
  static const Color transparent = Color(0x00000000);
  static const Color semiTransparent = Color(0x80FFFFFF);
  
  // =============================================
  // 🎨 GLASS EFFECT
  // =============================================
  static const Color glassLayer = Color(0xB3121414); // rgba(18,20,20,0.7)
  static const Color glassLayerLight = Color(0x80121414); // rgba(18,20,20,0.5)
}