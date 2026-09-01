import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/album_model.dart';
import '../../../data/models/song_model.dart';
import '../../providers/music_providers.dart';

class AddSongsScreen extends ConsumerStatefulWidget {
  final AlbumModel album;
  final List<SongModel> existingSongs;

  const AddSongsScreen({
    super.key,
    required this.album,
    this.existingSongs = const [],
  });

  @override
  ConsumerState<AddSongsScreen> createState() => _AddSongsScreenState();
}

class _AddSongsScreenState extends ConsumerState<AddSongsScreen> {
  final TextEditingController _searchController = TextEditingController();
  late List<SongModel> _selectedSongs;

  @override
  void initState() {
    super.initState();
    _selectedSongs = List.from(widget.existingSongs);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final songsAsync = ref.watch(allSongsProvider);

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
          'افزودن آهنگ',
          style: AppTextStyles.headline4,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, _selectedSongs);
            },
            child: Text(
              'تایید (${_selectedSongs.length})',
              style: AppTextStyles.button.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.tertiary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                controller: _searchController,
                style: AppTextStyles.body2,
                decoration: InputDecoration(
                  hintText: 'جستجوی آهنگ...',
                  hintStyle: AppTextStyles.body2Secondary,
                  border: InputBorder.none,
                  isDense: true,
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),
          Expanded(
            child: songsAsync.when(
              data: (songs) {
                final filteredSongs = _searchController.text.isEmpty
                    ? songs
                    : songs
                        .where((song) =>
                            song.title.contains(_searchController.text) ||
                            song.artist.contains(_searchController.text))
                        .toList();

                if (filteredSongs.isEmpty) {
                  return const Center(child: Text('آهنگی پیدا نشد!'));
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filteredSongs.length,
                  itemBuilder: (context, index) {
                    return _buildSongTile(filteredSongs[index]);
                  },
                );
              },
              loading: () => const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
              error: (error, stack) => Center(child: Text('خطا: $error')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSongTile(SongModel song) {
    final isSelected = _selectedSongs.any((s) => s.id == song.id);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedSongs.removeWhere((s) => s.id == song.id);
          } else {
            _selectedSongs.add(song);
          }
        });
      },
      child: Container(
        height: 56,
        margin: const EdgeInsets.only(bottom: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.1)
              : AppColors.tertiary,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? Border.all(
                  color: AppColors.primary.withOpacity(0.3),
                  width: 1,
                )
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isSelected ? AppColors.primary : AppColors.textTertiary,
                  width: 1,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check_rounded,
                      size: 16,
                      color: AppColors.textPrimary,
                    )
                  : null,
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
          ],
        ),
      ),
    );
  }
}
