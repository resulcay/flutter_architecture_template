import 'package:flutter_test/flutter_test.dart';
import 'package:gen/gen.dart';
import 'package:pureblog/product/init/config/app_environment.dart';
import 'package:pureblog/product/service/manager/product_network_manager.dart';
import 'package:pureblog/product/service/manager/product_service_path.dart';
import 'package:vexana/vexana.dart';

void main() {
  late final ProductNetworkManager manager;
  setUpAll(() {
    AppEnvironment.setEnvironment();
    manager = ProductNetworkManager.base();
  });

  group('Common API tests', () {
    test('Get blog items from api', () async {
      final response = await manager.send<Blog, List<Blog>>(
        ProductServivePath.blogs.withQuery('all'),
        parseModel: Blog(),
        method: RequestType.GET,
      );

      expect(response.data, isNotNull);
    });

    test('Get blog items from api with error', () async {
      manager.listenErrorMStatus(
        errorListener: (value) => expect(value, isNotNull),
      );

      final response = await manager.send<Blog, List<Blog>>(
        ProductServivePath.notExists.value,
        parseModel: Blog(),
        method: RequestType.GET,
      );

      expect(response.data, isNull);
    });
  });
}
