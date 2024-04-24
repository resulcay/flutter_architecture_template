import 'package:core/src/cache/core/cache_model.dart';

abstract class CacheManager {
  CacheManager({required this.path});

  Future<void> init({required List<CacheModel> items});
  void clear();

  final String? path;
}
