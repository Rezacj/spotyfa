import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 8,
          sigmaY: 8,
          tileMode: TileMode.mirror,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.secondary.withOpacity(0.85),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: -2,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const SafeArea(
            bottom: false,
            child: SizedBox(
              height: 8,
            ),
          ),
        ),
      ),
    );
  }
}
