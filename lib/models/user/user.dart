//& Made by PIG

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String email,
    required String name,
    required bool isAuthorized,
    required String scope,
    int? year,
    int? section,
    String? hallticketNumber,
    String? designation,
  }) = _User;
  // const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
