import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/song_model.dart';
import '../../data/repositories/music_repository_impl.dart';

// =============================================
// 🎵 Provider برای اسکن موسیقی
// =============================================
final musicScanProvider = FutureProvider<int>((ref) async {
  final repository = ref.watch(musicRepositoryProvider);
  return await repository.scanAndSaveAllSongs();
});

// =============================================
// 📚 Provider برای لیست آهنگ‌ها
// =============================================
final allSongsProvider = FutureProvider<List<SongModel>>((ref) async {
  final repository = ref.watch(musicRepositoryProvider);
  return await repository.getAllSongs();
});

// =============================================
// 📊 Provider برای تعداد آهنگ‌ها
// =============================================
final songCountProvider = Provider<int>((ref) {
  final songsAsync = ref.watch(allSongsProvider);
  return songsAsync.maybeWhen(
    data: (songs) => songs.length,
    orElse: () => 0,
  );
});