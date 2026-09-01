import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/datasources/local/isar_service.dart';
import '../../../data/models/album_model.dart';
import '../../../data/models/song_model.dart';
import 'add_songs_screen.dart';

class CreateAlbumScreen extends ConsumerStatefulWidget {
  final AlbumModel? existingAlbum;

  const CreateAlbumScreen({super.key, this.existingAlbum});

  @override
  ConsumerState<CreateAlbumScreen> createState() => _CreateAlbumScreenState();
}

class _CreateAlbumScreenState extends ConsumerState<CreateAlbumScreen> {
  final TextEditingController _nameController = TextEditingController();
  List<SongModel> _albumSongs = [];
  String? _nameError;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    if (widget.existingAlbum != null) {
      _nameController.text = widget.existingAlbum!.name;
      _loadAlbumSongs();
    }
  }

  Future<void> _loadAlbumSongs() async {
    final isarService = ref.read(isarServiceProvider);
    final songs = await isarService.getAlbumSongs(widget.existingAlbum!.id);
    setState(() {
      _albumSongs = songs;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

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
          widget.existingAlbum != null ? 'ویرایش آلبوم' : 'آلبوم جدید',
          style: AppTextStyles.headline4,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // =============================================
          // عکس آلبوم
          // =============================================
          Center(
            child: GestureDetector(
              onTap: () {
                // TODO: انتخاب عکس از گالری
              },
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: AppColors.tertiary,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // عکس یا placeholder
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: AppColors.tertiary,
                        child: const Icon(
                          Icons.album_rounded,
                          size: 64,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ),
                    // Overlay ویرایش
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.edit_rounded,
                              size: 32,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'ویرایش عکس',
                              style: AppTextStyles.caption.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // =============================================
          // نام آلبوم
          // =============================================
          Text(
            'نام آلبوم',
            style: AppTextStyles.caption,
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _nameController,
            style: AppTextStyles.body1,
            maxLength: 50,
            onChanged: (value) {
              if (_nameError != null) {
                setState(() {
                  _nameError = null;
                });
              }
            },
            decoration: InputDecoration(
              hintText: 'نام آلبوم را وارد کنید...',
              hintStyle: AppTextStyles.body2Secondary,
              counterText: '',
              errorText: _nameError,
              errorStyle: const TextStyle(
                color: AppColors.error,
                fontSize: 12,
              ),
              filled: true,
              fillColor: AppColors.tertiary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // =============================================
          // لیست آهنگ‌ها
          // =============================================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'لیست آهنگ‌ها',
                style: AppTextStyles.headline5,
              ),
              Text(
                '${_albumSongs.length} آهنگ',
                style: AppTextStyles.caption,
              ),
            ],
          ),
          const SizedBox(height: 8),
          // آهنگ‌ها
          if (_albumSongs.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text('هنوز آهنگی اضافه نشده!'),
              ),
            )
          else
            Column(
              children: _albumSongs.map((song) {
                return _buildSongTile(song);
              }).toList(),
            ),
          const SizedBox(height: 8),
          // =============================================
          // دکمه افزودن آهنگ جدید (dashed)
          // =============================================
          GestureDetector(
            onTap: _addSongs,
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.textTertiary,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_rounded,
                    size: 20,
                    color: AppColors.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'افزودن آهنگ جدید',
                    style: AppTextStyles.button.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          // =============================================
          // دکمه ذخیره تغییرات (مینیمال)
          // =============================================
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _saveAlbum,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: AppColors.textPrimary,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      'ذخیره',
                      style: AppTextStyles.button.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSongTile(SongModel song) {
    return Container(
      height: 56,
      margin: const EdgeInsets.only(bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.tertiary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.drag_indicator_rounded,
            size: 20,
            color: AppColors.textSecondary,
          ),
          const SizedBox(width: 8),
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
                  _formatDuration(song.duration),
                  style: AppTextStyles.songArtist,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          // دکمه حذف
          GestureDetector(
            onTap: () {
              _removeSong(song);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.delete_rounded,
                size: 20,
                color: AppColors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addSongs() async {
    final result = await Navigator.of(context).push<List<SongModel>>(
      MaterialPageRoute(
        builder: (context) => AddSongsScreen(
          album: widget.existingAlbum ?? AlbumModel()..name = _nameController.text,
          existingSongs: _albumSongs,
        ),
      ),
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        _albumSongs = result;
      });
    }
  }

  void _removeSong(SongModel song) {
    setState(() {
      _albumSongs.remove(song);
    });
  }

  Future<void> _saveAlbum() async {
    final name = _nameController.text.trim();

    if (name.isEmpty) {
      setState(() {
        _nameError = 'لطفاً نام آلبوم را وارد کنید!';
      });
      return;
    }

    if (name.length < 2) {
      setState(() {
        _nameError = 'نام آلبوم باید حداقل ۲ حرف باشد!';
      });
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final isarService = ref.read(isarServiceProvider);

      final album = widget.existingAlbum ?? AlbumModel();
      album.name = name;
      album.artist = 'نامشخص';

      await isarService.saveAlbum(album);

      // ذخیره آهنگ‌ها
      for (final song in _albumSongs) {
        await isarService.addSongToAlbum(album.id, song.id);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('آلبوم "$name" ذخیره شد!'),
            backgroundColor: AppColors.primary,
            behavior: SnackBarBehavior.floating,
          ),
        );

        Navigator.pop(context);
      }
    } catch (e) {
      debugPrint('Error saving album: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('خطا در ذخیره آلبوم: $e'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  String _formatDuration(int milliseconds) {
    final duration = Duration(milliseconds: milliseconds);
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}