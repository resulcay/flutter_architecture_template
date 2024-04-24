import 'package:core/src/cache/core/cache_model.dart';

abstract class CacheOperation<T extends CacheModel> {
  T? get(String id);
  void add(T item);
  void remove(String id);
  List<T> getAll();
  void addAll(List<T> items);
  void clear();
}
