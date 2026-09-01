import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/song_model.dart';
import '../../data/repositories/music_repository_impl.dart';

final musicScanProvider = FutureProvider<int>((ref) async {
  final repository = ref.watch(musicRepositoryProvider);
  return await repository.scanAndSaveAllSongs();
});

final allSongsProvider = FutureProvider<List<SongModel>>((ref) async {
  final repository = ref.watch(musicRepositoryProvider);
  return await repository.getAllSongs();
});

final songCountProvider = Provider<int>((ref) {
  final songsAsync = ref.watch(allSongsProvider);
  return songsAsync.maybeWhen(
    data: (songs) => songs.length,
    orElse: () => 0,
  );
});

// اسکن هوشمند - فقط موقع resume
final rescanMusicProvider = FutureProvider.autoDispose<void>((ref) async {
  final repository = ref.watch(musicRepositoryProvider);
  await repository.scanAndSaveAllSongs();
  ref.invalidate(allSongsProvider);
});
