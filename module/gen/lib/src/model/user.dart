import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@immutable
class User with EquatableMixin {
  User({
    this.userID,
    this.writerID,
    this.writerUserName,
    this.writerNameSurname,
    this.writerAbout,
    this.writerImage,
    this.writerMail,
    this.writerStatus,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final int? userID;
  final int? writerID;
  final String? writerUserName;
  final String? writerNameSurname;
  final String? writerAbout;
  final String? writerImage;
  final String? writerMail;
  final bool? writerStatus;

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [
        userID,
        writerID,
        writerUserName,
        writerNameSurname,
        writerAbout,
        writerImage,
        writerMail,
        writerStatus,
      ];

  User copyWith({
    int? userID,
    int? writerID,
    String? writerUserName,
    String? writerNameSurname,
    String? writerAbout,
    String? writerImage,
    String? writerMail,
    bool? writerStatus,
  }) {
    return User(
      writerID: writerID ?? this.writerID,
      writerUserName: writerUserName ?? this.writerUserName,
      writerNameSurname: writerNameSurname ?? this.writerNameSurname,
      writerAbout: writerAbout ?? this.writerAbout,
      writerImage: writerImage ?? this.writerImage,
      writerMail: writerMail ?? this.writerMail,
      writerStatus: writerStatus ?? this.writerStatus,
      userID: userID ?? this.userID,
    );
  }
}
