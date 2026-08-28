import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefsServiceProvider = Provider<SharedPrefsService>((ref) {
  return SharedPrefsService();
});

class SharedPrefsService {
  static const String _keyOnboardingDone = 'onboarding_done';
  static const String _keyUserName = 'user_name';

  // =============================================
  // ✅ چک کردن onboarding
  // =============================================
  Future<bool> isOnboardingDone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyOnboardingDone) ?? false;
  }

  Future<void> setOnboardingDone() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyOnboardingDone, true);
  }

  // =============================================
  // 👤 ذخیره اسم کاربر
  // =============================================
  Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUserName, name);
  }

  Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUserName);
  }
}