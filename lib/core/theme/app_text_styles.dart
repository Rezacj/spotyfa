import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._(); // Private constructor

  // =============================================
  // 📝 HEADINGS
  // =============================================
  
  // display-lg-mobile: 32px, w800, line-height 40px
  static const TextStyle headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
    height: 1.25,
  );

  // headline-md: 24px, w700, line-height 32px
  static const TextStyle headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: -0.3,
    height: 1.33,
  );

  // persian-title: 20px, w700, line-height 32px
  static const TextStyle headline3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: -0.2,
    height: 1.6,
  );

  // title-sm: 18px, w600, line-height 24px
  static const TextStyle headline4 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0,
    height: 1.33,
  );

  static const TextStyle headline5 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.1,
    height: 1.5,
  );

  static const TextStyle headline6 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.1,
    height: 1.4,
  );

  // =============================================
  // 📝 BODY TEXT
  // =============================================
  
  // body-md: 16px, w400, line-height 24px
  static const TextStyle body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    letterSpacing: 0.1,
    height: 1.5,
  );

  // body-sm: 14px, w400, line-height 20px
  static const TextStyle body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    letterSpacing: 0.1,
    height: 1.43,
  );

  // persian-body: 16px, w400, line-height 28px
  static const TextStyle body3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    letterSpacing: 0.1,
    height: 1.75,
  );

  static const TextStyle body2Secondary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    letterSpacing: 0.1,
    height: 1.43,
  );

  // =============================================
  // 📝 CAPTIONS & LABELS
  // =============================================
  
  // label-caps: 12px, w700, letter-spacing 0.05em
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    letterSpacing: 0.6,
    height: 1.33,
  );

  static const TextStyle captionBold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    letterSpacing: 0.2,
    height: 1.4,
  );

  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: AppColors.textTertiary,
    letterSpacing: 0.5,
    height: 1.3,
  );

  // =============================================
  // 📝 SPECIAL STYLES
  // =============================================
  
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.2,
    height: 1.4,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    letterSpacing: 0.2,
    height: 1.3,
  );

  static const TextStyle link = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    letterSpacing: 0.1,
    height: 1.4,
  );

  // =============================================
  // 📝 SONG TILE SPECIFIC
  // =============================================
  
  static const TextStyle songTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0,
    height: 1.4,
  );

  static const TextStyle songArtist = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    letterSpacing: 0,
    height: 1.3,
  );

  // =============================================
  // 📝 PLAYER SPECIFIC
  // =============================================
  
  static const TextStyle playerTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: -0.2,
    height: 1.3,
  );

  static const TextStyle playerArtist = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    letterSpacing: 0,
    height: 1.4,
  );

  static const TextStyle timeLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    letterSpacing: 0.1,
    height: 1.2,
  );

  // =============================================
  // 📝 MINI PLAYER SPECIFIC
  // =============================================
  
  static const TextStyle miniPlayerTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: 0,
    height: 1.3,
  );

  static const TextStyle miniPlayerArtist = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    letterSpacing: 0,
    height: 1.2,
  );

  // =============================================
  // 📝 NAVIGATION SPECIFIC
  // =============================================
  
  static const TextStyle navLabel = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: AppColors.textSecondary,
    letterSpacing: 0,
    height: 1.2,
  );

  static const TextStyle navLabelActive = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    letterSpacing: 0,
    height: 1.2,
  );
}