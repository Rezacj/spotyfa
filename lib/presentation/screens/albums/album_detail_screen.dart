import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spotyfa/presentation/screens/player/now_playing_screen.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/datasources/local/isar_service.dart';
import '../../../data/models/album_model.dart';
import '../../../data/models/song_model.dart';
import '../../providers/player_providers.dart';
import '../../widgets/main_layout.dart';
import 'add_songs_screen.dart';

class AlbumDetailScreen extends ConsumerStatefulWidget {
  final AlbumModel album;

  const AlbumDetailScreen({super.key, required this.album});

  @override
  ConsumerState<AlbumDetailScreen> createState() => _AlbumDetailScreenState();
}

class _AlbumDetailScreenState extends ConsumerState<AlbumDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 20,
            color: AppColors.textPrimary,
          ),
        ),
        title: Text(
          widget.album.name,
          style: AppTextStyles.headline4,
        ),
      ),
      body: FutureBuilder(
        future: ref.read(isarServiceProvider).getAlbumSongs(widget.album.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          final songs = snapshot.data ?? [];

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Header آلبوم
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppColors.tertiary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.album_rounded,
                      size: 48,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.album.name,
                          style: AppTextStyles.headline3,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.album.artist,
                          style: AppTextStyles.playerArtist,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${songs.length} آهنگ',
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // دکمه پخش همه
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton.icon(
                  onPressed: songs.isEmpty
                      ? null
                      : () {
                          _playAllSongs(songs);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  icon: const Icon(Icons.play_arrow_rounded, size: 24),
                  label: Text(
                    'پخش همه',
                    style: AppTextStyles.button.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // دکمه افزودن آهنگ
              SizedBox(
                width: double.infinity,
                height: 44,
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddSongsScreen(album: widget.album),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(
                      color: AppColors.primary,
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  icon: const Icon(Icons.add_rounded, size: 20),
                  label: Text(
                    'افزودن آهنگ',
                    style: AppTextStyles.button.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // لیست آهنگ‌ها
              if (songs.isEmpty)
                const Center(
                  child: Text('هنوز آهنگی در این آلبوم نیست!'),
                )
              else
                Column(
                  children: songs.map((song) {
                    return _buildSongTile(song, songs);
                  }).toList(),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSongTile(SongModel song, List<SongModel> allSongs) {
    return GestureDetector(
      onTap: () {
        _playSong(song, allSongs);
      },
      child: Container(
        height: 56,
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.tertiary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
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
            Text(
              _formatDuration(song.duration),
              style: AppTextStyles.caption,
            ),
          ],
        ),
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

  Future<void> _playAllSongs(List<SongModel> songs) async {
    try {
      await ref.read(playerProvider.notifier).playPlaylist(songs, 0);

      if (mounted) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NowPlayingScreen(
              song: songs.first,
              allSongs: songs,
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('Error playing all songs: $e');
    }
  }

  String _formatDuration(int milliseconds) {
    final duration = Duration(milliseconds: milliseconds);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}