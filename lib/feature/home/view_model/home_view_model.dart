import 'package:core/core.dart';
import 'package:gen/gen.dart';
import 'package:pureblog/feature/home/view_model/state/home_view_state.dart';
import 'package:pureblog/product/cache/model/blog_cache_model.dart';
import 'package:pureblog/product/service/interface/blog_manager.dart';
import 'package:pureblog/product/state/base/base_cubit.dart';

class HomeViewModel extends BaseCubit<HomeViewState> {
  HomeViewModel({
    required BlogManager blogManager,
    required HiveCacheOperation<BlogCacheModel> blogCacheOperation,
  })  : _blogManager = blogManager,
        _blogCacheOperation = blogCacheOperation,
        super(HomeViewState(isLoading: false));

  final BlogManager _blogManager;
  final HiveCacheOperation<BlogCacheModel> _blogCacheOperation;

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> getBlogs() async {
    final blogs = await _blogManager.fetchBlogs();
    _saveBlogs(blogs);
    emit(state.copyWith(blogs: blogs));
  }

  void _saveBlogs(List<Blog> blogs) {
    for (final blog in blogs) {
      _blogCacheOperation.add(BlogCacheModel(blog: blog));
    }
  }

  List<Blog> get cachedBlogs =>
      _blogCacheOperation.getAll().map((e) => e.blog).toList();
}
