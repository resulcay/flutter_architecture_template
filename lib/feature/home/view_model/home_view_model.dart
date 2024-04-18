import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pureblog/feature/home/view_model/state/home_view_state.dart';
import 'package:pureblog/product/service/interface/blog_manager.dart';

class HomeViewModel extends Cubit<HomeViewState> {
  HomeViewModel({required BlogManager blogManager})
      : _blogManager = blogManager,
        super(HomeViewState(isLoading: true));

  late final BlogManager _blogManager;

  void changeLoading() {
    emit(state.copyWith(isLoading: !state.isLoading));
  }

  Future<void> getBlogs() async {
    final blogs = await _blogManager.fetchBlogs();
    emit(state.copyWith(blogs: blogs));
  }
}
