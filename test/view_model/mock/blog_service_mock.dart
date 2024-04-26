import 'package:gen/gen.dart';
import 'package:mockito/mockito.dart';
import 'package:pureblog/product/service/interface/blog_manager.dart';

class BlogServiceMock extends Mock implements BlogManager {
  @override
  Future<List<Blog>> fetchBlogs() async {
    return [
      Blog(
        blogID: 1,
        blogTitle: 'Test Title 1',
        blogContent: 'Test Content 1',
        writerID: 1,
      ),
      Blog(
        blogID: 2,
        blogTitle: 'Test Title 2',
        blogContent: 'Test Content 2',
        writerID: 2,
      ),
      Blog(
        blogID: 3,
        blogTitle: 'Test Title 3',
        blogContent: 'Test Content 3',
        writerID: 3,
      ),
    ];
  }
}
