//& Made by PIG

import 'package:freezed_annotation/freezed_annotation.dart';

part 'scope.freezed.dart';
part 'scope.g.dart';

@freezed
class Scope with _$Scope {
  const factory Scope({
    required String branch,
    @Default("NA") String? year,
    @Default("NA") String? section,
  }) = _Scope;
  // const Scope._();

  factory Scope.fromJson(Map<String, dynamic> json) => _$ScopeFromJson(json);
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
