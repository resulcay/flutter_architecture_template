import 'package:flutter/foundation.dart';
import 'package:gen/gen.dart';
import 'package:pureblog/feature/home/view_model/state/home_view_state.dart';
import 'package:pureblog/product/cache/model/user_cache_model.dart';
import 'package:pureblog/product/service/interface/blog_manager.dart';
import 'package:pureblog/product/state/base/base_cubit.dart';
import 'package:pureblog/product/state/container/product_state_items.dart';

class HomeViewModel extends BaseCubit<HomeViewState> {
  HomeViewModel({required BlogManager blogManager})
      : _blogManager = blogManager,
        super(HomeViewState(isLoading: true));

  late final BlogManager _blogManager;

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> getBlogs() async {
    _saveDummyUser();
    if (kDebugMode) print(_users);

    final blogs = await _blogManager.fetchBlogs();
    emit(state.copyWith(blogs: blogs));
  }

  void _saveDummyUser() {
    final user = User(
      userID: 5,
      writerUserName: 'John Doe',
      writerMail: 'john@example.com',
      writerImage: 'https://example.com/john.jpg',
    );
    ProductStateItems.productCache.userCacheOperation
        .add(UserCacheModel(user: user));
  }

  List<User> get _users => ProductStateItems.productCache.userCacheOperation
      .getAll()
      .map((e) => e.user)
      .toList();
}
