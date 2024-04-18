import 'package:gen/gen.dart';
import 'package:pureblog/product/service/interface/blog_manager.dart';
import 'package:pureblog/product/service/manager/product_service_path.dart';
import 'package:vexana/vexana.dart';

final class BlogService extends BlogManager {
  BlogService({required INetworkManager<EmptyModel> networkManager})
      : _networkManager = networkManager;

  final INetworkManager<EmptyModel> _networkManager;

  @override
  Future<List<Blog>> fetchBlogs() async {
    final response = await _networkManager.send<Blog, List<Blog>>(
      ProductServivePath.blogs.withQuery('all'),
      parseModel: Blog(),
      method: RequestType.GET,
    );

    return response.data ?? [];
  }

  @override
  Future<Blog> getBlog() {
    throw UnimplementedError();
  }
}
