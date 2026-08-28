import 'package:isar/isar.dart';
import 'song_model.dart';
part 'artist_model.g.dart';

@collection
class ArtistModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String name; // نام خواننده

  String? coverPath; // مسیر عکس خواننده

  final songs = IsarLinks<SongModel>(); // آهنگ‌های خواننده

  int get songCount => songs.length;

  int get albumCount {
    final albums = <String>{};
    for (final song in songs) {
      albums.add(song.album);
    }
    return albums.length;
  }
}