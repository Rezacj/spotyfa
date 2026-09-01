import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/artwork_cache.dart';
import '../../../data/datasources/local/audio_query_service.dart';
import '../../../data/models/song_model.dart';
import '../../providers/music_providers.dart';
import '../../providers/player_providers.dart';
import '../../widgets/main_layout.dart';
import '../player/now_playing_screen.dart';

// Cache کوچیک برای لیست
final ArtworkCache _smallArtworkCache = ArtworkCache(maxSize: 100);

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final songsAsync = ref.watch(allSongsProvider);

    return MainLayout(
      currentIndex: _currentIndex,
      onNavTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      child: songsAsync.when(
        data: (songs) {
          return _buildSongList(songs);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (error, stack) => Center(
          child: Text('خطا: $error'),
        ),
      ),
    );
  }

  Widget _buildSongList(List<SongModel> songs) {
    return ListView.builder(
      padding: const EdgeInsets.only(
        top: 48,
        left: 16,
        right: 16,
        bottom: 180,
      ),
      itemCount: songs.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'کتابخانه موسیقی',
                style: AppTextStyles.headline1,
              ),
              const SizedBox(height: 16),
              _buildQuickAccessGrid(),
              const SizedBox(height: 24),
              Text(
                'همه آهنگ‌ها',
                style: AppTextStyles.headline4,
              ),
              const SizedBox(height: 12),
            ],
          );
        }

        final songIndex = index - 1;
        return _buildSongTile(songs[songIndex], songs);
      },
    );
  }

  Widget _buildSongTile(SongModel song, List<SongModel> allSongs) {
    return GestureDetector(
      onTap: () {
        _playSong(song, allSongs);
      },
      child: Container(
        height: 64,
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.tertiary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _buildArtwork(song),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: AppTextStyles.songTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    song.artist,
                    style: AppTextStyles.songArtist,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              _formatDuration(song.duration),
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArtwork(SongModel song) {
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

    // 3. از albumId بگیر
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
      color: AppColors.tertiary,
      child: const Icon(
        Icons.music_note_rounded,
        size: 24,
        color: AppColors.textSecondary,
      ),
    );
  }

  Future<void> _playSong(SongModel song, List<SongModel> allSongs) async {
    try {
      final initialIndex = allSongs.indexWhere((s) => s.id == song.id);

      await ref
          .read(playerProvider.notifier)
          .playPlaylist(allSongs, initialIndex);

      if (mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NowPlayingScreen(
              song: song,
              allSongs: allSongs,
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error playing song: $e');
    }
  }

  String _formatDuration(int milliseconds) {
    final duration = Duration(milliseconds: milliseconds);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  Widget _buildQuickAccessGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 3.2,
      children: [
        _buildQuickAccessCard(
          icon: Icons.history_rounded,
          label: 'آهنگهای اخیر',
          color: AppColors.primary,
        ),
        _buildQuickAccessCard(
          icon: Icons.favorite_rounded,
          label: 'آهنگهای مورد علاقه',
          color: AppColors.error,
        ),
        _buildQuickAccessCard(
          icon: Icons.queue_music_rounded,
          label: 'پلی‌لیستهای من',
          color: AppColors.primary,
        ),
        _buildQuickAccessCard(
          icon: Icons.download_rounded,
          label: 'دانلود شده',
          color: AppColors.textSecondary,
        ),
      ],
    );
  }

  Widget _buildQuickAccessCard({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.tertiary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              size: 20,
              color: color,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.body2,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}