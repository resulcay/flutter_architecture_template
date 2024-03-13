import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
@immutable
final class Category with EquatableMixin {
  Category({
    this.categoryID,
    this.categoryName,
    this.categoryDescription,
    this.categoryStatus,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  final int? categoryID;
  final String? categoryName;
  final String? categoryDescription;
  final bool? categoryStatus;

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  List<Object?> get props => [
        categoryID,
        categoryName,
        categoryDescription,
        categoryStatus,
      ];

  Category copyWith({
    int? categoryID,
    String? categoryName,
    String? categoryDescription,
    bool? categoryStatus,
  }) {
    return Category(
      categoryID: categoryID ?? this.categoryID,
      categoryName: categoryName ?? this.categoryName,
      categoryDescription: categoryDescription ?? this.categoryDescription,
      categoryStatus: categoryStatus ?? this.categoryStatus,
    );
  }
}
