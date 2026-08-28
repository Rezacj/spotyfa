import 'package:isar/isar.dart';
import 'song_model.dart';
part 'playlist_model.g.dart';

@collection
class PlaylistModel {
  Id id = Isar.autoIncrement;

  @Index()
  late String name; // نام پلی‌لیست

  String? description; // توضیحات
  String? coverPath; // مسیر کاور سفارشی

  @Index()
  late DateTime createdAt; // تاریخ ایجاد

  late DateTime updatedAt; // آخرین به‌روزرسانی

  final songs = IsarLinks<SongModel>(); // آهنگ‌های پلی‌لیست

  int get songCount => songs.length;
}

extension PlaylistModelX on PlaylistModel {
  Duration get totalDuration {
    var total = 0;
    for (final song in songs) {
      total += song.duration;
    }
    return Duration(milliseconds: total);
  }

  String get totalDurationFormatted {
    final d = totalDuration;
    final hours = d.inHours;
    final minutes = d.inMinutes % 60;
    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}';
    }
    return '$minutes دقیقه';
  }
}