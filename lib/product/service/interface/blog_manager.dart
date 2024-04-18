import 'package:gen/gen.dart';

abstract class BlogManager {
  Future<List<Blog>> fetchBlogs();
  Future<Blog> getBlog();
}
