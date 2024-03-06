import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pureblog/blog.dart';

class Manager {
  static Future<List<Blog>> fetchBlogs() async {
    Uri uri = Uri.parse('http://10.0.2.2:5000/api/blogs/all');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      List<Blog> blogs = data.map((item) => Blog.fromJson(item)).toList();

      return blogs;
    } else {
      throw Exception('Failed to load blogs');
    }
  }
}
