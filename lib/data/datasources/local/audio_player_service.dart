import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final audioPlayerServiceProvider = Provider<AudioPlayerService>((ref) {
  return AudioPlayerService();
});

class AudioPlayerService {
  final AudioPlayer _player;

  AudioPlayerService() : _player = AudioPlayer();

  // پخش یک آهنگ
  Future<void> playSong(String filePath) async {
    try {
      await _player.setFilePath(filePath);
      _player.play();
    } catch (e) {
      debugPrint('Error playing song: $e');
    }
  }

  // پخش لیست آهنگ‌ها
  Future<void> playPlaylist(List<String> filePaths, int initialIndex) async {
    try {
      final playlist = ConcatenatingAudioSource(
        children: filePaths.map((path) => AudioSource.file(path)).toList(),
      );

      await _player.setAudioSource(playlist, initialIndex: initialIndex);
      _player.play();
    } catch (e) {
      debugPrint('Error playing playlist: $e');
    }
  }

  // توقف
  Future<void> pause() async {
    await _player.pause();
  }

  // ادامه
  Future<void> resume() async {
    await _player.play();
  }

  // توقف کامل
  Future<void> stop() async {
    await _player.stop();
  }

  // Seek
  Future<void> seekTo(Duration position) async {
    try {
      await _player.seek(position);
    } catch (e) {
      debugPrint('Error seek: $e');
    }
  }

  // آهنگ بعدی
  Future<void> next() async {
    try {
      if (_player.hasNext) {
        await _player.seekToNext();
        _player.play();
      }
    } catch (e) {
      debugPrint('Error next: $e');
    }
  }

  // آهنگ قبلی
  Future<void> previous() async {
    try {
      if (_player.hasPrevious) {
        await _player.seekToPrevious();
        _player.play();
      }
    } catch (e) {
      debugPrint('Error previous: $e');
    }
  }

  // Shuffle
  Future<void> setShuffle(bool enabled) async {
    try {
      await _player.setShuffleModeEnabled(enabled);
      debugPrint('Shuffle set to: $enabled');
      debugPrint('Shuffle mode is now: ${_player.shuffleModeEnabled}');
    } catch (e) {
      debugPrint('Error shuffle: $e');
    }
  }

  // Repeat
  Future<void> setRepeat(LoopMode mode) async {
    try {
      await _player.setLoopMode(mode);
      debugPrint('Repeat set to: $mode');
      debugPrint('Loop mode is now: ${_player.loopMode}');
    } catch (e) {
      debugPrint('Error repeat: $e');
    }
  }

  // Stream ها
  Stream<Duration> get positionStream => _player.positionStream;
  Stream<Duration?> get durationStream => _player.durationStream;
  Stream<bool> get playingStream => _player.playingStream;
  Stream<int?> get currentIndexStream => _player.currentIndexStream;
  Stream<bool> get shuffleModeStream => _player.shuffleModeEnabledStream;
  Stream<LoopMode> get loopModeStream => _player.loopModeStream;

  // وضعیت فعلی
  bool get isPlaying => _player.playing;
  Duration get position => _player.position;
  Duration? get duration => _player.duration;
  bool get hasNext => _player.hasNext;
  bool get hasPrevious => _player.hasPrevious;
  bool get isShuffleEnabled => _player.shuffleModeEnabled;
  LoopMode get loopMode => _player.loopMode;

  // بستن
  Future<void> dispose() async {
    await _player.dispose();
  }
}