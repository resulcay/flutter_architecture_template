import 'package:gen/gen.dart';
import 'package:pureblog/product/service/manager/product_service_path.dart';
import 'package:vexana/vexana.dart';

final class BlogService {
  BlogService({required INetworkManager<EmptyModel> networkManager})
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  Future<List<Blog>> fetchBlogs() async {
    final response = await _networkManager.send<Blog, List<Blog>>(
      ProductServivePath.blogs.withQuery('all'),
      parseModel: Blog(),
      method: RequestType.GET,
    );

    return response.data ?? [];
  }
}
