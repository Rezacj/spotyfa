import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._(); // Private constructor to prevent instantiation

  // =============================================
  // 📱 APP INFO
  // =============================================
  static const String appName = 'SpotyFa';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'پخش موسیقی آفلاین';

  // =============================================
  // 🗄️ DATABASE
  // =============================================
  static const String databaseName = 'spotyfa_db';
  static const int databaseVersion = 1;

  // =============================================
  // 🎨 COLORS (HEX)
  // =============================================
  static const Color primaryColor = Color(0xFF1DB954);
  static const Color secondaryColor = Color(0xFF121212);
  static const Color tertiaryColor = Color(0xFF181818);
  static const Color naturalColor = Color(0xFFB3B3B3);

  // =============================================
  // 📏 SPACING
  // =============================================
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 12.0;
  static const double spacingL = 16.0;
  static const double spacingXL = 24.0;
  static const double spacingXXL = 32.0;

  // =============================================
  // 📐 BORDER RADIUS
  // =============================================
  static const double borderRadiusS = 4.0;
  static const double borderRadiusM = 8.0;
  static const double borderRadiusL = 12.0;
  static const double borderRadiusXL = 16.0;
  static const double borderRadiusRound = 24.0;

  // =============================================
  // 📐 SIZES
  // =============================================
  static const double miniPlayerHeight = 64.0;
  static const double songTileHeight = 64.0;
  static const double albumArtSizeSmall = 48.0;
  static const double albumArtSize = 120.0;
  static const double albumArtSizeLarge = 300.0;
  static const double playerControlSize = 64.0;
  static const double bottomNavHeight = 80.0;
  static const double headerHeight = 64.0;
  static const double splashLogoSize = 128.0;

  // =============================================
  // ⏱️ DURATIONS
  // =============================================
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration animationDurationFast = Duration(milliseconds: 150);
  static const Duration animationDurationSlow = Duration(milliseconds: 500);
  static const Duration splashDuration = Duration(milliseconds: 2500);
  static const Duration splashFadeDuration = Duration(seconds: 1);

  // =============================================
  // 🎵 AUDIO
  // =============================================
  static const List<String> supportedAudioExtensions = [
    '.mp3',
    '.flac',
    '.aac',
    '.wav',
    '.ogg',
    '.m4a',
    '.opus',
  ];

  static const Duration playerUpdateInterval = Duration(milliseconds: 500);
  static const Duration scanTimeout = Duration(seconds: 30);

  // =============================================
  // ⚙️ SETTINGS KEYS
  // =============================================
  static const String settingsRepeatMode = 'repeat_mode';
  static const String settingsShuffleEnabled = 'shuffle_enabled';
  static const String settingsAutoPlay = 'auto_play';
  static const String settingsSortOrder = 'sort_order';
  static const String settingsAutoScan = 'auto_scan';
  static const String settingsThemeMode = 'theme_mode';
  static const String settingsAccentColor = 'accent_color';
  static const String settingsShowLyrics = 'show_lyrics';
  static const String settingsLastSongId = 'last_song_id';
  static const String settingsLastPosition = 'last_position';
  static const String settingsLastQueue = 'last_queue';
  static const String settingsLastPlaylistId = 'last_playlist_id';

  // =============================================
  // ⚙️ DEFAULT VALUES
  // =============================================
  static const int defaultRepeatMode = 0; // 0: off, 1: all, 2: one
  static const bool defaultShuffleEnabled = false;
  static const bool defaultAutoPlay = true;
  static const int defaultSortOrder = 0; // 0: title, 1: artist, 2: date
  static const bool defaultAutoScan = true;
  static const int defaultThemeMode = 0; // 0: dark, 1: light
  static const int defaultAccentColor = 0xFF1DB954;
  static const bool defaultShowLyrics = false;

  // =============================================
  // 📏 LIMITS
  // =============================================
  static const int maxPlaylistNameLength = 50;
  static const int maxSearchResults = 50;
  static const int maxRecentSearches = 10;
  static const int maxQueueLength = 1000;

  // =============================================
  // 🧭 ROUTES
  // =============================================
  static const String routeSplash = '/splash';
  static const String routeHome = '/home';
  static const String routeNowPlaying = '/now-playing';
  static const String routePlaylistDetail = '/playlist-detail';
  static const String routeSearch = '/search';
  static const String routeSettings = '/settings';
  static const String routeAlbumDetail = '/album-detail';
  static const String routeArtistDetail = '/artist-detail';

  // =============================================
  // 🗂️ STORAGE PATHS
  // =============================================
  static const String cacheFolderName = 'cache';
  static const String imageCacheFolderName = 'images';
  static const String tempFolderName = 'temp';

  // =============================================
  // 🔑 PERMISSION CODES
  // =============================================
  static const int permissionStorageCode = 1001;
  static const int permissionAudioCode = 1002;

  // =============================================
  // 📱 PLATFORM
  // =============================================
  static const String platformAndroid = 'android';
  static const String platformIOS = 'ios';
}