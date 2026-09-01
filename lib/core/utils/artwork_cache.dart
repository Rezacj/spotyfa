import 'dart:typed_data';

class ArtworkCache {
  final int maxSize;
  final Map<String, Uint8List?> _cache = {};

  ArtworkCache({this.maxSize = 100});

  Uint8List? get(String key) {
    final value = _cache[key];
    if (value != null) {
      _cache.remove(key);
      _cache[key] = value;
    }
    return value;
  }

  void put(String key, Uint8List? value) {
    if (_cache.containsKey(key)) {
      _cache.remove(key);
    }

    _cache[key] = value;

    if (_cache.length > maxSize) {
      final oldestKey = _cache.keys.first;
      _cache.remove(oldestKey);
    }
  }

  void clear() {
    _cache.clear();
  }

  bool containsKey(String key) => _cache.containsKey(key);
}