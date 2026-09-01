import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../models/album_model.dart' as my;
import '../../models/artist_model.dart' as my_artist;
import '../../models/song_model.dart' as my_song;

final audioQueryServiceProvider = Provider<AudioQueryService>((ref) {
  return AudioQueryService();
});

class AudioQueryService {
  final OnAudioQuery _audioQuery;

  AudioQueryService() : _audioQuery = OnAudioQuery();

  // =============================================
  // 🎵 اسکن همه آهنگ‌ها
  // =============================================
  Future<List<my_song.SongModel>> scanAllSongs() async {
    try {
      final songs = await _audioQuery.querySongs(
        sortType: SongSortType.TITLE,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );

      return songs.map((song) {
        return my_song.SongModel()
          ..filePath = song.data
          ..title = song.title
          ..artist = song.artist ?? 'نامشخص'
          ..album = song.album ?? 'نامشخص'
          ..albumId = song.albumId // ← ذخیره albumId
          ..genre = song.genre
          ..trackNumber = song.track
          ..duration = song.duration ?? 0
          ..dateAdded = DateTime.now();
      }).toList();
    } catch (e) {
      debugPrint('Error scanning songs: $e');
      return [];
    }
  }

  // =============================================
  // 🖼️ گرفتن کاور با albumId مستقیم
  // =============================================
  Future<Uint8List?> getAlbumArtwork(int albumId) async {
    try {
      return await _audioQuery.queryArtwork(
        albumId,
        ArtworkType.ALBUM,
      );
    } catch (e) {
      debugPrint('Error getting album artwork: $e');
      return null;
    }
  }

  // =============================================
  // 🖼️ گرفتن کاور با SongModel (سریع)
  // =============================================
  Future<Uint8List?> getArtworkBySong(my_song.SongModel song) async {
    if (song.albumId != null) {
      return await getAlbumArtwork(song.albumId!);
    }
    return null;
  }

  // =============================================
  // 📁 اسکن آلبوم‌ها
  // =============================================
  Future<List<my.AlbumModel>> scanAllAlbums() async {
    try {
      final albums = await _audioQuery.queryAlbums(
        sortType: AlbumSortType.ALBUM,
        orderType: OrderType.ASC_OR_SMALLER,
        ignoreCase: true,
      );

      return albums.map((album) {
        return my.AlbumModel()
          ..name = album.album
          ..artist = album.artist ?? 'نامشخص';
      }).toList();
    } catch (e) {
      debugPrint('Error scanning albums: $e');
      return [];
    }
  }

  // =============================================
  // 🎤 اسکن هنرمندان
  // =============================================
  Future<List<my_artist.ArtistModel>> scanAllArtists() async {
    try {
      final artists = await _audioQuery.queryArtists(
        sortType: ArtistSortType.ARTIST,
        orderType: OrderType.ASC_OR_SMALLER,
        ignoreCase: true,
      );

      return artists.map((artist) {
        return my_artist.ArtistModel()
          ..name = artist.artist;
      }).toList();
    } catch (e) {
      debugPrint('Error scanning artists: $e');
      return [];
    }
  }

  // =============================================
  // ✅ چک کردن مجوز
  // =============================================
  Future<bool> checkPermission() async {
    try {
      return await _audioQuery.permissionsStatus();
    } catch (e) {
      debugPrint('Error checking permission: $e');
      return false;
    }
  }

  Future<bool> requestPermission() async {
    try {
      return await _audioQuery.permissionsRequest();
    } catch (e) {
      debugPrint('Error requesting permission: $e');
      return false;
    }
  }
}