import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/datasources/local/shared_prefs_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _nameController = TextEditingController();
  int _currentPage = 0;
  String? _nameError;

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: Column(
          children: [
            // Page indicator
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: index == _currentPage ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == _currentPage
                          ? AppColors.primary
                          : AppColors.surface,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            // Pages
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildWelcomePage(),
                  _buildFeaturePage(),
                  _buildNamePage(),
                ],
              ),
            ),
            // Continue button
            Padding(
              padding: const EdgeInsets.all(24),
              child: _buildContinueButton(),
            ),
          ],
        ),
      ),
    );
  }

  // =============================================
  // صفحه ۱: Welcome
  // =============================================
  Widget _buildWelcomePage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.primary.withOpacity(0.3),
              width: 2,
            ),
          ),
          child: const Icon(
            Icons.music_note_rounded,
            size: 64,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'به اسپاتیفا خوش آمدید',
          textAlign: TextAlign.center,
          style: AppTextStyles.headline1,
        ),
        const SizedBox(height: 16),
        Text(
          'یک اپلیکیشن موزیک پلیر آفلاین داری\nکه ظاهر جذاب داره',
          textAlign: TextAlign.center,
          style: AppTextStyles.body2Secondary,
        ),
      ],
    );
  }

  // =============================================
  // صفحه ۲: Feature
  // =============================================
  Widget _buildFeaturePage() {
    return Column(
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
            Icons.offline_bolt_rounded,
            size: 48,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'همیشه در دسترس',
          textAlign: TextAlign.center,
          style: AppTextStyles.headline2,
        ),
        const SizedBox(height: 16),
        Text(
          'دیگه نگران اینترنت نباش!\nآهنگ‌هات همیشه همراهتن، حتی وقتی آفلاینی.',
          textAlign: TextAlign.center,
          style: AppTextStyles.body2Secondary,
        ),
      ],
    );
  }

  // =============================================
  // صفحه ۳: Name Input
  // =============================================
  Widget _buildNamePage() {
    return Column(
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
            Icons.person_rounded,
            size: 48,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'اسمت رو بهم بگو',
          textAlign: TextAlign.center,
          style: AppTextStyles.headline2,
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: TextField(
            controller: _nameController,
            style: AppTextStyles.body1,
            textAlign: TextAlign.center,
            maxLength: 30,
            onChanged: (value) {
              // پاک کردن ارور وقتی کاربر تایپ می‌کنه
              if (_nameError != null) {
                setState(() {
                  _nameError = null;
                });
              }
            },
            decoration: InputDecoration(
              hintText: 'اسمت رو اینجا بنویس...',
              hintStyle: AppTextStyles.body2Secondary,
              counterText: '', // مخفی کردن شمارنده
              errorText: _nameError,
              errorStyle: const TextStyle(
                color: AppColors.error,
                fontSize: 12,
              ),
              filled: true,
              fillColor: AppColors.tertiary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.error,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.error,
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // =============================================
  // دکمه ادامه
  // =============================================
  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        onPressed: _handleContinue,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.textPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'ادامه',
          style: AppTextStyles.button.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  // =============================================
  // منطق دکمه ادامه
  // =============================================
  void _handleContinue() {
    if (_currentPage == 2) {
      final name = _nameController.text.trim();

      if (name.isEmpty) {
        setState(() {
          _nameError = 'لطفاً اسمت رو وارد کن!';
        });
        return;
      }

      if (name.replaceAll(' ', '').isEmpty) {
        setState(() {
          _nameError = 'اسم نمی‌تونه فقط فاصله باشه!';
        });
        return;
      }

      if (name.length < 2) {
        setState(() {
          _nameError = 'اسم باید حداقل ۲ حرف باشه!';
        });
        return;
      }

      // ذخیره اسم
      _saveNameAndGoToPermission(name);
      return;
    }

    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _saveNameAndGoToPermission(String name) async {
    final prefsService = ref.read(sharedPrefsServiceProvider);
    await prefsService.saveUserName(name);

    if (mounted) {
      Navigator.of(context).pushReplacementNamed('/permission');
    }
  }
}
