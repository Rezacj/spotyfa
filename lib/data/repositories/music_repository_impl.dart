import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/local/audio_query_service.dart';
import '../datasources/local/isar_service.dart';
import '../models/album_model.dart';
import '../models/artist_model.dart';
import '../models/song_model.dart';

final musicRepositoryProvider = Provider<MusicRepository>((ref) {
  final isarService = ref.watch(isarServiceProvider);
  final audioQueryService = ref.watch(audioQueryServiceProvider);
  return MusicRepository(isarService, audioQueryService);
});

class MusicRepository {
  final IsarService _isarService;
  final AudioQueryService _audioQueryService;

  MusicRepository(this._isarService, this._audioQueryService);

  // =============================================
  // 🎵 اسکن و ذخیره همه آهنگ‌ها
  // =============================================
  Future<int> scanAndSaveAllSongs() async {
    final songs = await _audioQueryService.scanAllSongs();
    await _isarService.saveAllSongs(songs);
    return songs.length;
  }

  // =============================================
  // 📚 گرفتن همه آهنگ‌ها
  // =============================================
  Future<List<SongModel>> getAllSongs() async {
    return await _isarService.getAllSongs();
  }

  // =============================================
  // 📁 اسکن و ذخیره آلبوم‌ها
  // =============================================
  Future<int> scanAndSaveAllAlbums() async {
    final albums = await _audioQueryService.scanAllAlbums();
    await _isarService.saveAllAlbums(albums);
    return albums.length;
  }

  // =============================================
  // 🎤 اسکن و ذخیره هنرمندان
  // =============================================
  Future<int> scanAndSaveAllArtists() async {
    final artists = await _audioQueryService.scanAllArtists();
    await _isarService.saveAllArtists(artists);
    return artists.length;
  }
}