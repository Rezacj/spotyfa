import 'package:isar/isar.dart';

import 'song_model.dart';

part 'album_model.g.dart';

@collection
class AlbumModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String name;

  @Index()
  late String artist;

  String? coverPath;
  int? year;

  final songs = IsarLinks<SongModel>();

  int get songCount => songs.length;
}