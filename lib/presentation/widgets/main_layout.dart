import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import 'app_header.dart';
import 'bottom_nav_bar.dart';
import 'mini_player.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final int currentIndex;
  final Function(int) onNavTap;
  final bool showMiniPlayer;

  const MainLayout({
    super.key,
    required this.child,
    required this.currentIndex,
    required this.onNavTap,
    this.showMiniPlayer = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Stack(
        children: [
          // محتوای اصلی
          Positioned.fill(
            child: child,
          ),

          // Header
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppHeader(),
          ),

          // Mini Player
          if (showMiniPlayer)
            Positioned(
              bottom: 110, // ← از 100 به 120 تغییر کرد
              left: 0,
              right: 0,
              child: MiniPlayer(
                songTitle: 'آهنگ زیبا',
                artistName: 'هنرمند',
                isPlaying: false,
                onTap: () {
                  // Navigate to Now Playing
                },
              ),
            ),

          // Bottom Nav
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavBar(
              currentIndex: currentIndex,
              onTap: onNavTap,
            ),
          ),
        ],
      ),
    );
  }
}
