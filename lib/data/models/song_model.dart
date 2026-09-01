import 'package:isar/isar.dart';

part 'song_model.g.dart';

@collection
class SongModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String filePath;

  late String title;
  late String artist;
  late String album;

  int? albumId; // ← اضافه شد
  String? albumArtPath;
  String? genre;
  int? trackNumber;

  late int duration;

  @Index()
  late DateTime dateAdded;

  @Index()
  bool isFavorite = false;

  @Index()
  int playCount = 0;

  DateTime? lastPlayed;
}