import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:pureblog/product/widget/project_network_image.dart';

class BlogList extends StatelessWidget {
  const BlogList({required this.blogs, super.key});
  final List<Blog> blogs;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: blogs.length,
      itemBuilder: (context, index) {
        final blog = blogs[index];
        return ListTile(
          title: Text(
            blog.blogTitle!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            blog.blogContent!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          leading: ProjectNetworkImage(
            imageUrl: 'https://pureblog.com.tr${blog.blogImage}',
          ),
        );
      },
    );
  }
}
