import 'package:get_it/get_it.dart';
import 'package:pureblog/product/service/manager/product_network_manager.dart';
import 'package:pureblog/product/state/view_model/product_view_model.dart';

final class ProductContainer {
  ProductContainer._();

  static final _getIt = GetIt.I;
  static void setup() {
    _getIt
      ..registerSingleton<ProductNetworkManager>(ProductNetworkManager.base())
      ..registerLazySingleton<ProductViewModel>(ProductViewModel.new);
  }

  static T read<T extends Object>() => _getIt<T>();
}
