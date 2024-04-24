import 'package:flutter/material.dart';
import 'package:pureblog/product/service/manager/product_network_manager.dart';
import 'package:pureblog/product/state/container/product_state_items.dart';
import 'package:pureblog/product/state/view_model/product_view_model.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  ProductViewModel get productViewModel => ProductStateItems.productViewModel;
  //ProductViewModel get productViewModel => context.read<ProductViewModel>();
}
