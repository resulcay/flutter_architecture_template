import 'package:core/core.dart';
import 'package:mockito/mockito.dart';
import 'package:pureblog/product/cache/model/blog_cache_model.dart';

class BlogCacheMock extends Mock implements HiveCacheOperation<BlogCacheModel> {
  final List<BlogCacheModel> _blogCacheModel = [];
  @override
  void add(BlogCacheModel item) {
    _blogCacheModel.add(item);
  }

  @override
  List<BlogCacheModel> getAll() {
    return _blogCacheModel;
  }
}
