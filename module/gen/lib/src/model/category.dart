import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends INetworkModel<Category> with EquatableMixin {
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

  @override
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  @override
  Category fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

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
