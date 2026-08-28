import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        14,
        0,
        14,
        30,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 22,
            sigmaY: 22,
          ),
          child: Container(
            height: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),

              // ============================================
              // گرادیان پس‌زمینه برای جلوگیری از سیاهی
              // ============================================
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.08),
                  Colors.white.withOpacity(0.03),
                  Colors.white.withOpacity(0.06),
                ],
              ),

              // پس‌زمینه تیره با شفافیت کم
              color: AppColors.tertiary.withOpacity(0.4),

              // Glass border
              border: Border.all(
                color: Colors.white.withOpacity(0.12),
                width: 0.8,
              ),

              // Soft shadow
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 30,
                  spreadRadius: -8,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Top glass highlight
                Positioned(
                  left: 24,
                  right: 24,
                  top: 0,
                  child: IgnorePointer(
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.3),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Bottom subtle highlight
                Positioned(
                  left: 50,
                  right: 50,
                  bottom: 0,
                  child: IgnorePointer(
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.08),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // Navigation
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 6,
                  ),
                  child: Row(
                    children: [
                      _buildNavItem(
                        icon: Icons.home_rounded,
                        label: 'خانه',
                        index: 0,
                      ),
                      _buildNavItem(
                        icon: Icons.search_rounded,
                        label: 'جستجو',
                        index: 1,
                      ),
                      _buildNavItem(
                        icon: Icons.library_music_rounded,
                        label: 'کتابخانه',
                        index: 2,
                      ),
                      _buildNavItem(
                        icon: Icons.settings_rounded,
                        label: 'تنظیمات',
                        index: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final bool isActive = currentIndex == index;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,
          margin: const EdgeInsets.symmetric(
            horizontal: 3,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),

            // Active glass
            color:
                isActive ? Colors.white.withOpacity(0.14) : Colors.transparent,

            border: isActive
                ? Border.all(
                    color: Colors.white.withOpacity(0.15),
                    width: 0.7,
                  )
                : null,

            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 12,
                      spreadRadius: -5,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          child: Stack(
            children: [
              if (isActive)
                Positioned(
                  left: 16,
                  right: 16,
                  top: 0,
                  child: Container(
                    height: 1,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.white.withOpacity(0.25),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedScale(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOutBack,
                      scale: isActive ? 1.06 : 1.0,
                      child: Icon(
                        icon,
                        size: 23,
                        color: isActive
                            ? Colors.white
                            : Colors.white.withOpacity(0.62),
                      ),
                    ),
                    const SizedBox(height: 3),
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 220),
                      curve: Curves.easeOut,
                      style: isActive
                          ? AppTextStyles.navLabelActive.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            )
                          : AppTextStyles.navLabel.copyWith(
                              color: Colors.white.withOpacity(0.58),
                            ),
                      child: Text(label),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
