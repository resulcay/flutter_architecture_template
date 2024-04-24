import 'package:gen/gen.dart';
import 'package:pureblog/feature/home/view/home_view.dart';
import 'package:pureblog/feature/home/view_model/home_view_model.dart';
import 'package:pureblog/product/service/manager/blog_service.dart';
import 'package:pureblog/product/service/manager/product_network_error_manager.dart';
import 'package:pureblog/product/state/base/base_state.dart';
import 'package:pureblog/product/state/container/product_state_items.dart';

mixin HomeViewMixin on BaseState<HomeView> {
  late final HomeViewModel _viewModel;
  late final ProductNetworkErrorManager _errorManager;
  List<Blog> blogs = [];
  HomeViewModel get viewModel => _viewModel;

  @override
  void initState() {
    _errorManager = ProductNetworkErrorManager(context: context);

    ProductStateItems.productNetworkManager
        .listenErrorStatus(errorListener: _errorManager.handleError);

    _viewModel = HomeViewModel(
      blogManager: BlogService(networkManager: productNetworkManager),
    );
    super.initState();
  }
}
