import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../../data/datasources/local/audio_player_service.dart';
import '../../data/datasources/local/isar_service.dart';
import '../../data/models/song_model.dart';
import '../../data/models/settings_model.dart';

final playerProvider =
    StateNotifierProvider<PlayerNotifier, PlayerState>((ref) {
  final audioPlayerService = ref.watch(audioPlayerServiceProvider);
  final isarService = ref.watch(isarServiceProvider);
  return PlayerNotifier(audioPlayerService, isarService);
});

class PlayerNotifier extends StateNotifier<PlayerState> {
  final AudioPlayerService _audioPlayerService;
  final IsarService _isarService;
  List<SongModel> _currentPlaylist = [];

  PlayerNotifier(this._audioPlayerService, this._isarService)
      : super(const PlayerState.initial()) {
    _listenToPlayer();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final settings = await _isarService.getSettings();
    if (settings != null) {
      state = state.copyWith(
        shuffleEnabled: settings.shuffleEnabled,
        repeatMode: settings.repeatMode,
      );
    }
  }

  Future<void> _saveSettings() async {
    final settings = await _isarService.getSettings();
    if (settings != null) {
      settings.shuffleEnabled = state.shuffleEnabled;
      settings.repeatMode = state.repeatMode;
      await _isarService.saveSettings(settings);
    }
  }

  void _listenToPlayer() {
    _audioPlayerService.positionStream.listen((position) {
      state = state.copyWith(position: position);
    });

    _audioPlayerService.durationStream.listen((duration) {
      state = state.copyWith(duration: duration ?? Duration.zero);
    });

    _audioPlayerService.playingStream.listen((isPlaying) {
      state = state.copyWith(isPlaying: isPlaying);
    });

    _audioPlayerService.currentIndexStream.listen((index) {
      if (index != null && index >= 0 && index < _currentPlaylist.length) {
        state = state.copyWith(
          currentSong: _currentPlaylist[index],
          currentIndex: index,
        );
      }
    });

    _audioPlayerService.shuffleModeStream.listen((enabled) {
      state = state.copyWith(shuffleEnabled: enabled);
    });

    _audioPlayerService.loopModeStream.listen((mode) {
      final repeatMode = switch (mode) {
        LoopMode.off => 0,
        LoopMode.all => 1,
        LoopMode.one => 2,
      };
      state = state.copyWith(repeatMode: repeatMode);
    });
  }

  Future<void> playPlaylist(List<SongModel> songs, int initialIndex) async {
    _currentPlaylist = songs;
    final filePaths = songs.map((s) => s.filePath).toList();

    await _audioPlayerService.playPlaylist(filePaths, initialIndex);

    state = state.copyWith(
      isPlaying: true,
      currentSong: songs[initialIndex],
      currentIndex: initialIndex,
    );
  }

  Future<void> togglePlayPause() async {
    if (state.isPlaying) {
      await _audioPlayerService.pause();
    } else {
      await _audioPlayerService.resume();
    }
  }

  Future<void> seekTo(Duration position) async {
    await _audioPlayerService.seekTo(position);
  }

  Future<void> next() async {
    await _audioPlayerService.next();
  }

  Future<void> previous() async {
    await _audioPlayerService.previous();
  }

  Future<void> toggleShuffle() async {
    final newShuffleValue = !state.shuffleEnabled;

    if (newShuffleValue) {
      await _audioPlayerService.setRepeat(LoopMode.off);
    }

    await _audioPlayerService.setShuffle(newShuffleValue);
    await _saveSettings();
  }

  Future<void> toggleRepeat() async {
    final nextMode = switch (state.repeatMode) {
      0 => LoopMode.all,
      1 => LoopMode.one,
      2 => LoopMode.off,
      _ => LoopMode.off,
    };

    if (nextMode != LoopMode.off) {
      await _audioPlayerService.setShuffle(false);
    }

    await _audioPlayerService.setRepeat(nextMode);
    await _saveSettings();
  }
}

class PlayerState {
  final SongModel? currentSong;
  final int currentIndex;
  final bool isPlaying;
  final Duration position;
  final Duration duration;
  final bool shuffleEnabled;
  final int repeatMode;

  const PlayerState({
    this.currentSong,
    this.currentIndex = 0,
    this.isPlaying = false,
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.shuffleEnabled = false,
    this.repeatMode = 0,
  });

  const PlayerState.initial()
      : currentSong = null,
        currentIndex = 0,
        isPlaying = false,
        position = Duration.zero,
        duration = Duration.zero,
        shuffleEnabled = false,
        repeatMode = 0;

  PlayerState copyWith({
    SongModel? currentSong,
    int? currentIndex,
    bool? isPlaying,
    Duration? position,
    Duration? duration,
    bool? shuffleEnabled,
    int? repeatMode,
  }) {
    return PlayerState(
      currentSong: currentSong ?? this.currentSong,
      currentIndex: currentIndex ?? this.currentIndex,
      isPlaying: isPlaying ?? this.isPlaying,
      position: position ?? this.position,
      duration: duration ?? this.duration,
      shuffleEnabled: shuffleEnabled ?? this.shuffleEnabled,
      repeatMode: repeatMode ?? this.repeatMode,
    );
  }
}