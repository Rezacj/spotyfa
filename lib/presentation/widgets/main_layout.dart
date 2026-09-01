import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../providers/music_providers.dart';
import '../providers/player_providers.dart';
import '../screens/albums/albums_screen.dart';
import '../screens/player/now_playing_screen.dart';
import 'app_header.dart';
import 'bottom_nav_bar.dart';
import 'mini_player.dart';

class MainLayout extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Stack(
        children: [
          // محتوا
          Positioned.fill(
            child: RepaintBoundary(
              child: child,
            ),
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
              bottom: 110,
              left: 0,
              right: 0,
              child: RepaintBoundary(
                child: MiniPlayer(
                  onTap: () {
                    final playerState = ref.read(playerProvider);
                    final currentSong = playerState.currentSong;
                    if (currentSong != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NowPlayingScreen(
                            song: currentSong,
                            allSongs: ref.read(allSongsProvider).maybeWhen(
                                  data: (songs) => songs,
                                  orElse: () => [currentSong],
                                ),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          // Bottom Nav
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: RepaintBoundary(
              child: BottomNavBar(
                currentIndex: currentIndex,
                onTap: onNavTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
