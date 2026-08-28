import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/datasources/local/shared_prefs_service.dart';

class PermissionScreen extends ConsumerStatefulWidget {
  const PermissionScreen({super.key});

  @override
  ConsumerState<PermissionScreen> createState() => _PermissionScreenState();
}

class _PermissionScreenState extends ConsumerState<PermissionScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.folder_open_rounded,
                  size: 48,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'برای دیدن آهنگات\nبه مجوز نیاز دارم',
                textAlign: TextAlign.center,
                style: AppTextStyles.headline2,
              ),
              const SizedBox(height: 16),
              Text(
                'این مجوز فقط برای دسترسی به فایل‌های موسیقی روی دستگاهت استفاده میشه.',
                textAlign: TextAlign.center,
                style: AppTextStyles.body2Secondary,
              ),
              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _requestPermissions,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textPrimary,
                    disabledBackgroundColor: AppColors.surface,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          'تایید مجوزها',
                          style: AppTextStyles.button.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _requestPermissions() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // درخواست مجوز صوتی
      final audioStatus = await Permission.audio.request();

      if (audioStatus.isGranted) {
        // علامت‌گذاری onboarding انجام شده
        final prefsService = ref.read(sharedPrefsServiceProvider);
        await prefsService.setOnboardingDone();

        if (mounted) {
          Navigator.of(context).pushReplacementNamed('/loading');
        }
        return;
      }

      // اگه بار اول رد شد، یکبار دیگه تلاش کن
      final retryStatus = await Permission.audio.request();

      if (retryStatus.isGranted) {
        // علامت‌گذاری onboarding انجام شده
        final prefsService = ref.read(sharedPrefsServiceProvider);
        await prefsService.setOnboardingDone();

        if (mounted) {
          Navigator.of(context).pushReplacementNamed('/loading');
        }
        return;
      }

      // اگه بازم رد شد، پیام بده
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('برای استفاده از برنامه باید مجوز رو بدی!'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: 'تنظیمات',
              textColor: AppColors.textPrimary,
              onPressed: () {
                openAppSettings();
              },
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('Permission error: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطا در گرفتن مجوز: $e'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}