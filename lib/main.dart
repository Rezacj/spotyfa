import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core/constants/app_constants.dart';
import 'data/models/album_model.dart';
import 'data/models/artist_model.dart';
import 'data/models/playlist_model.dart';
import 'data/models/settings_model.dart';
import 'data/models/song_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppConstants.secondaryColor,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  // Initialize Isar
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [
      SongModelSchema,
      PlaylistModelSchema,
      AlbumModelSchema,
      ArtistModelSchema,
      SettingsModelSchema,
    ],
    directory: dir.path,
    name: AppConstants.databaseName,
  );

  runApp(
    ProviderScope(
      overrides: [
        isarProvider.overrideWithValue(isar),
      ],
      child: const SpotyFaApp(),
    ),
  );
}

// Isar Provider
final isarProvider = Provider<Isar>((ref) {
  throw UnimplementedError('Isar instance must be provided in main');
});