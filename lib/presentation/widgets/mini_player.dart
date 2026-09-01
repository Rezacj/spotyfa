import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/artwork_cache.dart';
import '../../data/datasources/local/audio_query_service.dart';
import '../../data/models/song_model.dart';
import '../providers/player_providers.dart';

// Cache کوچیک برای MiniPlayer
final ArtworkCache _smallArtworkCache = ArtworkCache(maxSize: 50);

class MiniPlayer extends ConsumerWidget {
  final VoidCallback? onTap;

  const MiniPlayer({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerProvider);
    final currentSong = playerState.currentSong;

    if (currentSong == null) {
      return const SizedBox.shrink();
    }

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20,
              tileMode: TileMode.mirror,
            ),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(0.08),
                    Colors.white.withOpacity(0.03),
                    Colors.white.withOpacity(0.06),
                  ],
                ),
                color: AppColors.tertiary.withOpacity(0.4),
                border: Border.all(
                  color: Colors.white.withOpacity(0.12),
                  width: 0.8,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 20,
                    spreadRadius: -6,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      height: 2,
                      color: Colors.white.withOpacity(0.05),
                      child: FractionallySizedBox(
                        widthFactor: _getProgressFactor(playerState),
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.5),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: _buildAlbumArt(currentSong, ref),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                currentSong.title,
                                style: AppTextStyles.miniPlayerTitle.copyWith(
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2),
                              Text(
                                currentSong.artist,
                                style: AppTextStyles.miniPlayerArtist.copyWith(
                                  color: Colors.white.withOpacity(0.6),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref.read(playerProvider.notifier).togglePlayPause();
                          },
                          child: Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: playerState.isPlaying
                                  ? AppColors.primary.withOpacity(0.2)
                                  : Colors.white.withOpacity(0.1),
                              shape: BoxShape.circle,
                              boxShadow: playerState.isPlaying
                                  ? [
                                      BoxShadow(
                                        color:
                                            AppColors.primary.withOpacity(0.3),
                                        blurRadius: 8,
                                      ),
                                    ]
                                  : null,
                            ),
                            child: Icon(
                              playerState.isPlaying
                                  ? Icons.pause_rounded
                                  : Icons.play_arrow_rounded,
                              size: 20,
                              color: playerState.isPlaying
                                  ? AppColors.primary
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAlbumArt(SongModel song, WidgetRef ref) {
    // 1. چک cache کوچیک
    if (_smallArtworkCache.containsKey(song.filePath)) {
      final cached = _smallArtworkCache.get(song.filePath);
      if (cached != null) {
        return Image.memory(
          cached,
          fit: BoxFit.cover,
          cacheWidth: 96,
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
          cacheWidth: 96,
          errorBuilder: (context, error, stack) => _placeholder(),
        );
      }
    }

    // 3. از queryArtwork بگیر
    final audioQueryService = ref.read(audioQueryServiceProvider);

    return FutureBuilder<Uint8List?>(
      future: audioQueryService.getArtworkBySong(song).then((data) {
        _smallArtworkCache.put(song.filePath, data);
        return data;
      }),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Image.memory(
            snapshot.data!,
            fit: BoxFit.cover,
            cacheWidth: 96,
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
        size: 22,
        color: Colors.white70,
      ),
    );
  }

  double _getProgressFactor(PlayerState state) {
    if (state.duration.inMilliseconds <= 0) return 0;
    return (state.position.inMilliseconds / state.duration.inMilliseconds)
        .clamp(0.0, 1.0);
  }
}