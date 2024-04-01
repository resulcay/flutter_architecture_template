import 'package:flutter/material.dart';
import 'package:pureblog/feature/home/view/home_view.dart';
import 'package:pureblog/product/service/manager/blog_service.dart';
import 'package:pureblog/product/service/manager/product_network_error_manager.dart';
import 'package:pureblog/product/state/container/product_state_items.dart';

mixin HomeViewMixin on State<HomeView> {
  late final BlogService blogService;
  late final ProductNetworkErrorManager errorManager;

  @override
  void initState() {
    blogService =
        BlogService(networkManager: ProductStateItems.productNetworkManager);
    errorManager = ProductNetworkErrorManager(context: context);

    ProductStateItems.productNetworkManager
        .listenErrorMStatus(errorListener: errorManager.handleError);
    super.initState();
  }
}
