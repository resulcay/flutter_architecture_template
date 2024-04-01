import 'package:pureblog/product/service/manager/product_network_manager.dart';
import 'package:pureblog/product/state/container/product_state_container.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();
}
