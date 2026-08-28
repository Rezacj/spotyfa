import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../providers/music_providers.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    _scanMusic();
  }

  Future<void> _scanMusic() async {
    try {
      // اسکن موسیقی
      final count = await ref.read(musicScanProvider.future);
      debugPrint('✅ $count آهنگ پیدا شد!');

      // بعد از اسکن، برو به Home
      if (mounted) {
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            Navigator.of(context).pushReplacementNamed('/home');
          }
        });
      }
    } catch (e) {
      debugPrint('❌ خطا در اسکن موسیقی: $e');
      // حتی اگه خطا هم بده، برو به Home
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
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
                Icons.library_music_rounded,
                size: 48,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'در حال بارگذاری آهنگ‌ها...',
              style: AppTextStyles.headline3,
            ),
            const SizedBox(height: 16),
            // نمایش تعداد آهنگ‌های پیدا شده
            Consumer(
              builder: (context, ref, child) {
                final songCount = ref.watch(songCountProvider);
                if (songCount > 0) {
                  return Text(
                    '$songCount آهنگ پیدا شد!',
                    style: AppTextStyles.body2Secondary,
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 24),
            const SizedBox(
              width: 48,
              height: 48,
              child: CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}