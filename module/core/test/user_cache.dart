import 'package:core/src/cache/core/cache_model.dart';

class UserCache with CacheModel {
  UserCache({required this.id, required this.name});
  UserCache.empty()
      : id = '',
        name = '';
  @override
  final String id;
  final String name;

  @override
  UserCache fromDynamicJson(dynamic json) {
    final mapItems = json as Map<String, dynamic>;
    return UserCache(
      id: mapItems['id'] as String,
      name: mapItems['name'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
