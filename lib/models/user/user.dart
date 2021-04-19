//& Made by PIG

import 'package:freezed_annotation/freezed_annotation.dart';
import '../scope/scope.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String email,
    required String name,
    required bool isAuthorized,
    required Scope scope,
    // required String scope,
    // int? year,
    // int? section,
    String? hallticketNumber,
    String? designation,
  }) = _User;
  // const User._();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

/// [scope] example
//{
//"branch" : "CSE",
//"year" : "4",
//"section" : "B",
//}

//* NA not aplicable

/// [scope] for authorized
// {
// "branch" : "CSE",
// "year" : "NA",
// "section" : "NA"
// }
