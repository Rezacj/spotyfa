import 'package:isar/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../main.dart';
import '../../models/album_model.dart';
import '../../models/artist_model.dart';
import '../../models/playlist_model.dart';
import '../../models/settings_model.dart';
import '../../models/song_model.dart';

final isarServiceProvider = Provider<IsarService>((ref) {
  final isar = ref.watch(isarProvider);
  return IsarService(isar);
});

class IsarService {
  final Isar _isar;

  IsarService(this._isar);

  // =============================================
  // 🎵 SONGS
  // =============================================
  IsarCollection<SongModel> get songs => _isar.songModels;

  Future<List<SongModel>> getAllSongs() async {
    return await _isar.songModels.where().findAll();
  }

  Future<SongModel?> getSongById(int id) async {
    return await _isar.songModels.get(id);
  }

  Future<void> saveSong(SongModel song) async {
    await _isar.writeTxn(() async {
      await _isar.songModels.put(song);
    });
  }

  Future<void> saveAllSongs(List<SongModel> songs) async {
    await _isar.writeTxn(() async {
      await _isar.songModels.putAll(songs);
    });
  }

  Future<void> deleteSong(int id) async {
    await _isar.writeTxn(() async {
      await _isar.songModels.delete(id);
    });
  }

  // =============================================
  // 📁 PLAYLISTS
  // =============================================
  IsarCollection<PlaylistModel> get playlists => _isar.playlistModels;

  Future<List<PlaylistModel>> getAllPlaylists() async {
    return await _isar.playlistModels.where().findAll();
  }

  Future<PlaylistModel?> getPlaylistById(int id) async {
    return await _isar.playlistModels.get(id);
  }

  Future<void> savePlaylist(PlaylistModel playlist) async {
    await _isar.writeTxn(() async {
      await _isar.playlistModels.put(playlist);
    });
  }

  Future<void> deletePlaylist(int id) async {
    await _isar.writeTxn(() async {
      await _isar.playlistModels.delete(id);
    });
  }

  // =============================================
  // 💿 ALBUMS
  // =============================================
  IsarCollection<AlbumModel> get albums => _isar.albumModels;

  Future<List<AlbumModel>> getAllAlbums() async {
    return await _isar.albumModels.where().findAll();
  }

  Future<void> saveAlbum(AlbumModel album) async {
    await _isar.writeTxn(() async {
      await _isar.albumModels.put(album);
    });
  }

  Future<void> saveAllAlbums(List<AlbumModel> albums) async {
    await _isar.writeTxn(() async {
      await _isar.albumModels.putAll(albums);
    });
  }

  // =============================================
  // 🎤 ARTISTS
  // =============================================
  IsarCollection<ArtistModel> get artists => _isar.artistModels;

  Future<List<ArtistModel>> getAllArtists() async {
    return await _isar.artistModels.where().findAll();
  }

  Future<void> saveArtist(ArtistModel artist) async {
    await _isar.writeTxn(() async {
      await _isar.artistModels.put(artist);
    });
  }

  Future<void> saveAllArtists(List<ArtistModel> artists) async {
    await _isar.writeTxn(() async {
      await _isar.artistModels.putAll(artists);
    });
  }

  // =============================================
  // ⚙️ SETTINGS
  // =============================================
  Future<SettingsModel?> getSettings() async {
    final settings = await _isar.settingsModels.where().findFirst();
    if (settings == null) {
      final newSettings = SettingsModel();
      await _isar.writeTxn(() async {
        await _isar.settingsModels.put(newSettings);
      });
      return newSettings;
    }
    return settings;
  }

  Future<void> saveSettings(SettingsModel settings) async {
    await _isar.writeTxn(() async {
      await _isar.settingsModels.put(settings);
    });
  }

  // =============================================
  // 🗑️ CLOSE
  // =============================================
  Future<void> close() async {
    await _isar.close();
  }
}