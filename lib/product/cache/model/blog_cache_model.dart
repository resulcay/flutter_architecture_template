import 'package:core/core.dart';
import 'package:gen/gen.dart';

final class BlogCacheModel with CacheModel {
  BlogCacheModel({required this.blog});
  BlogCacheModel.empty() : blog = Blog();

  final Blog blog;

  @override
  BlogCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;

    if (jsonMap == null) return this;

    return copyWith(blog: Blog.fromJson(jsonMap));
  }

  @override
  String get id => blog.blogID.toString();

  @override
  Map<String, dynamic> toJson() => blog.toJson();

  BlogCacheModel copyWith({Blog? blog}) {
    return BlogCacheModel(blog: blog ?? this.blog);
  }
}
