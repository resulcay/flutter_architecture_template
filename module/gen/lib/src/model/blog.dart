import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gen/src/model/category.dart';
import 'package:gen/src/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'blog.g.dart';

@JsonSerializable()
@immutable
final class Blog with EquatableMixin {
  Blog({
    this.blogID,
    this.blogTitle,
    this.blogContent,
    this.blogImage,
    this.blogCreatedAt,
    this.blogStatus,
    this.categoryID,
    this.category,
    this.writerID,
    this.writer,
  });

  factory Blog.fromJson(Map<String, dynamic> json) => _$BlogFromJson(json);

  final int? blogID;
  final String? blogTitle;
  final String? blogContent;
  final String? blogImage;
  final DateTime? blogCreatedAt;
  final bool? blogStatus;
  final int? categoryID;
  final Category? category;
  final int? writerID;
  final User? writer;

  Map<String, dynamic> toJson() => _$BlogToJson(this);

  @override
  List<Object?> get props => [
        blogID,
        blogTitle,
        blogContent,
        blogImage,
        blogCreatedAt,
        blogStatus,
        categoryID,
        category,
        writerID,
        writer,
      ];

  Blog copyWith({
    int? blogID,
    String? blogTitle,
    String? blogContent,
    String? blogImage,
    String? blogCreatedAt,
    bool? blogStatus,
    int? categoryID,
    Category? category,
    int? writerID,
    User? writer,
  }) {
    return Blog(
      blogID: blogID ?? this.blogID,
      blogTitle: blogTitle ?? this.blogTitle,
      blogContent: blogContent ?? this.blogContent,
      blogImage: blogImage ?? this.blogImage,
      blogCreatedAt: blogCreatedAt as DateTime? ?? this.blogCreatedAt,
      blogStatus: blogStatus ?? this.blogStatus,
      categoryID: categoryID ?? this.categoryID,
      category: category ?? this.category,
      writerID: writerID ?? this.writerID,
      writer: writer ?? this.writer,
    );
  }
}
