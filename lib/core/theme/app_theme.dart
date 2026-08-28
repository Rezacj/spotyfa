import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._(); // Private constructor

  // =============================================
  // 🎨 DARK THEME
  // =============================================
  static ThemeData get dark => _buildDarkTheme();

  static ThemeData _buildDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // =============================================
      // 🎨 COLORS
      // =============================================
      scaffoldBackgroundColor: AppColors.secondary,
      canvasColor: AppColors.secondary,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        onPrimary: AppColors.textPrimary,
        secondary: AppColors.primaryLight,
        onSecondary: AppColors.textPrimary,
        surface: AppColors.tertiary,
        onSurface: AppColors.textPrimary,
        background: AppColors.secondary,
        onBackground: AppColors.textPrimary,
        error: AppColors.error,
        onError: AppColors.textPrimary,
        outline: AppColors.textTertiary,
        outlineVariant: AppColors.surface,
      ),

      // =============================================
      // 📝 TYPOGRAPHY
      // =============================================
      textTheme: const TextTheme(
        displayLarge: AppTextStyles.headline1,
        displayMedium: AppTextStyles.headline2,
        displaySmall: AppTextStyles.headline3,
        headlineLarge: AppTextStyles.headline4,
        headlineMedium: AppTextStyles.headline5,
        headlineSmall: AppTextStyles.headline6,
        bodyLarge: AppTextStyles.body1,
        bodyMedium: AppTextStyles.body2,
        bodySmall: AppTextStyles.body3,
        labelLarge: AppTextStyles.button,
        labelMedium: AppTextStyles.buttonSmall,
        labelSmall: AppTextStyles.overline,
        titleLarge: AppTextStyles.headline4,
        titleMedium: AppTextStyles.headline5,
        titleSmall: AppTextStyles.headline6,
      ),

      // =============================================
      // 📱 APP BAR
      // =============================================
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.secondary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: AppTextStyles.headline4,
        iconTheme: IconThemeData(
          color: AppColors.textPrimary,
          size: 24,
        ),
        actionsIconTheme: IconThemeData(
          color: AppColors.textPrimary,
          size: 24,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      // =============================================
      // 🧭 BOTTOM NAVIGATION
      // =============================================
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.bottomNavBackground,
        selectedItemColor: AppColors.bottomNavSelected,
        unselectedItemColor: AppColors.bottomNavUnselected,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: AppTextStyles.navLabelActive,
        unselectedLabelStyle: AppTextStyles.navLabel,
        showUnselectedLabels: true,
        showSelectedLabels: true,
      ),

      // =============================================
      // 🃏 CARD
      // =============================================
      cardTheme: CardThemeData(
        color: AppColors.tertiary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      ),

      // =============================================
      // ➖ DIVIDER
      // =============================================
      dividerTheme: const DividerThemeData(
        color: AppColors.surface,
        thickness: 1,
        space: 1,
      ),

      // =============================================
      // 📝 INPUT DECORATION
      // =============================================
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        hintStyle: AppTextStyles.body2Secondary,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.error,
            width: 2,
          ),
        ),
      ),

      // =============================================
      // 💬 DIALOG
      // =============================================
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.tertiary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        titleTextStyle: AppTextStyles.headline5,
        contentTextStyle: AppTextStyles.body2,
      ),

      // =============================================
      // 📋 BOTTOM SHEET
      // =============================================
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.tertiary,
        modalBackgroundColor: AppColors.tertiary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        showDragHandle: true,
        dragHandleColor: AppColors.textTertiary,
      ),

      // =============================================
      // 🎚️ SLIDER
      // =============================================
      sliderTheme: SliderThemeData(
        activeTrackColor: AppColors.seekBarProgress,
        inactiveTrackColor: AppColors.seekBarBackground,
        thumbColor: AppColors.seekBarThumb,
        overlayColor: AppColors.seekBarProgress.withOpacity(0.1),
        valueIndicatorColor: AppColors.primary,
        valueIndicatorTextStyle: AppTextStyles.caption,
        trackHeight: 2,
        thumbShape: const RoundSliderThumbShape(
          enabledThumbRadius: 6,
          disabledThumbRadius: 6,
        ),
        overlayShape: const RoundSliderOverlayShape(
          overlayRadius: 12,
        ),
      ),

      // =============================================
      // 🔘 SWITCH
      // =============================================
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.textPrimary;
          }
          return AppColors.textTertiary;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.surface;
        }),
        trackOutlineColor: WidgetStateProperty.all(AppColors.transparent),
      ),

      // =============================================
      // ☑️ CHECKBOX
      // =============================================
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return AppColors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.textPrimary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: const BorderSide(
          color: AppColors.textTertiary,
          width: 1,
        ),
      ),

      // =============================================
      // ⏳ PROGRESS INDICATOR
      // =============================================
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearTrackColor: AppColors.surface,
        circularTrackColor: AppColors.surface,
      ),

      // =============================================
      // 🍿 SNACKBAR
      // =============================================
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.surface,
        contentTextStyle: AppTextStyles.body2,
        actionTextColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 8,
        insetPadding: const EdgeInsets.all(16),
      ),

      // =============================================
      // 📋 LIST TILE
      // =============================================
      listTileTheme: const ListTileThemeData(
        iconColor: AppColors.textSecondary,
        textColor: AppColors.textPrimary,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        minLeadingWidth: 24,
      ),

      // =============================================
      // 🎯 ICON THEME
      // =============================================
      iconTheme: const IconThemeData(
        color: AppColors.textPrimary,
        size: 24,
      ),

      // =============================================
      // 🔘 FLOATING ACTION BUTTON
      // =============================================
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textPrimary,
        elevation: 8,
        shape: CircleBorder(),
        extendedTextStyle: AppTextStyles.button,
      ),

      // =============================================
      // 🔄 PAGE TRANSITIONS
      // =============================================
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          // TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),

      // =============================================
      // 💦 SPLASH EFFECTS
      // =============================================
      splashColor: AppColors.primary.withOpacity(0.1),
      highlightColor: AppColors.primary.withOpacity(0.05),
      hoverColor: AppColors.primary.withOpacity(0.05),
      focusColor: AppColors.primary.withOpacity(0.1),
    );
  }
}