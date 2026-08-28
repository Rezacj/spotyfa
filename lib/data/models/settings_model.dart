import 'package:isar/isar.dart';

part 'settings_model.g.dart';

@collection
class SettingsModel {
  Id id = Isar.autoIncrement;

  // =============================================
  // 🎵 پخش موسیقی
  // =============================================
  int repeatMode = 0; // 0: off, 1: all, 2: one
  bool shuffleEnabled = false;
  bool autoPlay = true;
  bool continueLastPlayback = false;

  // =============================================
  // 📚 کتابخانه
  // =============================================
  bool autoScan = true;
  int sortOrder = 0; // 0: title, 1: artist, 2: date
  List<String> excludedFolders = [];

  // =============================================
  // 🎨 ظاهر
  // =============================================
  int themeMode = 0; // 0: dark, 1: light
  int accentColor = 0xFF1DB954;
  bool showLyrics = false;

  // =============================================
  // 📱 آخرین وضعیت پخش
  // =============================================
  int? lastSongId;
  int? lastPosition; // میلی‌ثانیه
  List<int> lastQueueIds = [];
  int? lastPlaylistId;

  // =============================================
  // 🔢 متادیتا
  // =============================================
  DateTime? lastScanTime;
  int scanCount = 0;
}