import 'package:get_it/get_it.dart';
import 'package:pureblog/product/service/manager/product_network_manager.dart';

final class ProductContainer {
  ProductContainer._();

  static final _getIt = GetIt.I;
  static void setup() {
    _getIt
        .registerSingleton<ProductNetworkManager>(ProductNetworkManager.base());
  }

  static T read<T extends Object>() => _getIt<T>();
}
