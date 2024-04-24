import 'package:core/core.dart';
import 'package:gen/gen.dart';

final class UserCacheModel with CacheModel {
  UserCacheModel({required this.user});
  UserCacheModel.empty() : user = User();

  final User user;

  @override
  UserCacheModel fromDynamicJson(dynamic json) {
    final jsonMap = json as Map<String, dynamic>?;

    if (jsonMap == null) return this;

    return copyWith(user: User.fromJson(jsonMap));
  }

  @override
  String get id => user.userID.toString();

  @override
  Map<String, dynamic> toJson() => user.toJson();

  UserCacheModel copyWith({User? user}) {
    return UserCacheModel(user: user ?? this.user);
  }
}
