import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/artwork_cache.dart';
import '../../../data/datasources/local/audio_query_service.dart';
import '../../../data/datasources/local/isar_service.dart';
import '../../../data/models/song_model.dart';
import '../../providers/player_providers.dart';

// Cache بزرگ برای NowPlaying
final ArtworkCache _fullArtworkCache = ArtworkCache(maxSize: 30);

class NowPlayingScreen extends ConsumerWidget {
  final SongModel song;
  final List<SongModel> allSongs;

  const NowPlayingScreen({
    super.key,
    required this.song,
    required this.allSongs,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerProvider);
    final currentSong = playerState.currentSong ?? song;
    final isarService = ref.watch(isarServiceProvider);
    final isFavorite = currentSong.isFavorite;

    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.4,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.elevated,
                      AppColors.tertiary,
                      AppColors.secondary,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.15,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    center: const Alignment(1, -1),
                    radius: 1.5,
                    colors: [
                      AppColors.primary.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.tertiary.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 24,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: _buildAlbumArt(currentSong, ref),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      currentSong.title,
                      style: AppTextStyles.playerTitle,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      currentSong.artist,
                      style: AppTextStyles.playerArtist.copyWith(
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Slider(
                        value: playerState.position.inSeconds
                            .toDouble()
                            .clamp(
                              0,
                              playerState.duration.inSeconds.toDouble() > 0
                                  ? playerState.duration.inSeconds.toDouble()
                                  : 1,
                            ),
                        max: playerState.duration.inSeconds.toDouble() > 0
                            ? playerState.duration.inSeconds.toDouble()
                            : 1,
                        onChanged: (value) {
                          ref
                              .read(playerProvider.notifier)
                              .seekTo(Duration(seconds: value.toInt()));
                        },
                        activeColor: AppColors.primary,
                        inactiveColor: AppColors.elevated,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDuration(playerState.position),
                            style: AppTextStyles.timeLabel,
                          ),
                          Text(
                            _formatDuration(playerState.duration),
                            style: AppTextStyles.timeLabel,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          ref.read(playerProvider.notifier).toggleShuffle();
                        },
                        icon: Icon(
                          Icons.shuffle_rounded,
                          size: 24,
                          color: playerState.shuffleEnabled
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ref.read(playerProvider.notifier).previous();
                        },
                        icon: const Icon(
                          Icons.skip_next_rounded,
                          size: 32,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          ref.read(playerProvider.notifier).togglePlayPause();
                        },
                        child: Container(
                          width: 64,
                          height: 64,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.3),
                                blurRadius: 16,
                              ),
                            ],
                          ),
                          child: Icon(
                            playerState.isPlaying
                                ? Icons.pause_rounded
                                : Icons.play_arrow_rounded,
                            size: 40,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ref.read(playerProvider.notifier).next();
                        },
                        icon: const Icon(
                          Icons.skip_previous_rounded,
                          size: 32,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ref.read(playerProvider.notifier).toggleRepeat();
                        },
                        icon: Icon(
                          playerState.repeatMode == 2
                              ? Icons.repeat_one_rounded
                              : Icons.repeat_rounded,
                          size: 24,
                          color: playerState.repeatMode > 0
                              ? AppColors.primary
                              : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async {
                          await _toggleFavorite(currentSong, isarService);
                        },
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          size: 24,
                          color: isFavorite
                              ? AppColors.primary
                              : AppColors.textPrimary,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.playlist_add_rounded,
                          size: 24,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _toggleFavorite(
    SongModel song,
    IsarService isarService,
  ) async {
    try {
      song.isFavorite = !song.isFavorite;
      await isarService.saveSong(song);
      debugPrint('Favorite toggled: ${song.isFavorite}');
    } catch (e) {
      debugPrint('Error toggling favorite: $e');
    }
  }

  Widget _buildAlbumArt(SongModel song, WidgetRef ref) {
    // 1. چک cache بزرگ
    if (_fullArtworkCache.containsKey(song.filePath)) {
      final cached = _fullArtworkCache.get(song.filePath);
      if (cached != null) {
        return Image.memory(
          cached,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stack) => _placeholder(),
        );
      }
      return _placeholder();
    }

    // 2. چک مسیر مستقیم
    if (song.albumArtPath != null && song.albumArtPath!.isNotEmpty) {
      final file = File(song.albumArtPath!);
      if (file.existsSync()) {
        return Image.file(
          file,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stack) => _placeholder(),
        );
      }
    }

    // 3. از queryArtwork بگیر - کیفیت کامل
    final audioQueryService = ref.read(audioQueryServiceProvider);

    return FutureBuilder<Uint8List?>(
      future: audioQueryService.getArtworkBySong(song).then((data) {
        _fullArtworkCache.put(song.filePath, data);
        return data;
      }),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Image.memory(
            snapshot.data!,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stack) => _placeholder(),
          );
        }
        return _placeholder();
      },
    );
  }

  Widget _placeholder() {
    return Container(
      color: AppColors.elevated,
      child: const Icon(
        Icons.music_note_rounded,
        size: 120,
        color: AppColors.textSecondary,
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}