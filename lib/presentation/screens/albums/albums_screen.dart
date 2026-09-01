import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/datasources/local/isar_service.dart';
import '../../../data/models/album_model.dart';
import '../../widgets/main_layout.dart';
import '../home/home_screen.dart';
import 'create_album_screen.dart';

final Map<String, Uint8List?> _artworkCache = {};

class AlbumsScreen extends ConsumerStatefulWidget {
  const AlbumsScreen({super.key});

  @override
  ConsumerState<AlbumsScreen> createState() => _AlbumsScreenState();
}

class _AlbumsScreenState extends ConsumerState<AlbumsScreen> {
  int _currentIndex = 2;
  final TextEditingController _searchController = TextEditingController();
  String _sortBy = 'name';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      currentIndex: _currentIndex,
      onNavTap: (index) {
        if (index == 0) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else {
          setState(() {
            _currentIndex = index;
          });
        }
      },
      child: FutureBuilder(
        future: ref.read(isarServiceProvider).getAllAlbums(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          final albums = snapshot.data ?? [];

          return ListView(
            padding: const EdgeInsets.only(
              top: 48,
              left: 16,
              right: 16,
              bottom: 180,
            ),
            children: [
              // Search Bar
              // Search Bar + دکمه ایجاد
              Row(
                children: [
                  // Search Bar (کوچیک‌تر)
                  Expanded(
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
                          hintText: 'جستجوی آلبوم‌ها...',
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
                  const SizedBox(width: 8),
                  // دکمه + جدا
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CreateAlbumScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add_rounded,
                        size: 20,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Header
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'همه آلبوم‌ها (${albums.length})',
                      style: AppTextStyles.headline4,
                    ),
                  ),
                  PopupMenuButton<String>(
                    color: AppColors.elevated,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    onSelected: (value) {
                      setState(() {
                        _sortBy = value;
                      });
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'name',
                        child: Text(
                          'نام آلبوم',
                          style: AppTextStyles.body2.copyWith(
                            color: _sortBy == 'name'
                                ? AppColors.primary
                                : AppColors.textPrimary,
                          ),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'artist',
                        child: Text(
                          'نام هنرمند',
                          style: AppTextStyles.body2.copyWith(
                            color: _sortBy == 'artist'
                                ? AppColors.primary
                                : AppColors.textPrimary,
                          ),
                        ),
                      ),
                    ],
                    child: Row(
                      children: [
                        Text('مرتب‌سازی', style: AppTextStyles.caption),
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.sort_rounded,
                          size: 20,
                          color: AppColors.textSecondary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // آلبوم‌ها
              if (albums.isEmpty)
                const EmptyAlbumsState()
              else
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: albums.length,
                  itemBuilder: (context, index) {
                    return _buildAlbumCard(albums[index]);
                  },
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAlbumCard(AlbumModel album) {
    return GestureDetector(
      onTap: () {
        // TODO: باز کردن صفحه جزئیات آلبوم
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // کاور آلبوم
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.tertiary,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: _buildAlbumCover(album),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            album.name,
            style: AppTextStyles.songTitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            album.artist,
            style: AppTextStyles.songArtist,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildAlbumCover(AlbumModel album) {
    if (album.coverPath != null && album.coverPath!.isNotEmpty) {
      final file = File(album.coverPath!);
      if (file.existsSync()) {
        return Image.file(
          file,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stack) => _placeholder(),
        );
      }
    }
    return _placeholder();
  }

  Widget _placeholder() {
    return Container(
      color: AppColors.tertiary,
      child: const Icon(
        Icons.album_rounded,
        size: 48,
        color: AppColors.textSecondary,
      ),
    );
  }
}

class EmptyAlbumsState extends StatelessWidget {
  const EmptyAlbumsState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 80),
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.tertiary,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.album_rounded,
            size: 48,
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'هنوز هیچ آلبومی وجود ندارد',
          style: AppTextStyles.headline4,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CreateAlbumScreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textPrimary,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 12,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'ایجاد آلبوم جدید',
            style: AppTextStyles.button.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
