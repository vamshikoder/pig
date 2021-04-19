// GENERATED CODE - DO NOT MODIFY BY HAND
//ignore_for_file:non_constant_identifier_names
part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    email: json['email'] as String,
    name: json['name'] as String,
    isAuthorized: json['isAuthorized'] as bool,
    scope: Scope.fromJson(json['scope'] as Map<String, dynamic>),
    hallticketNumber: json['hallticketNumber'] as String?,
    designation: json['designation'] as String?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'isAuthorized': instance.isAuthorized,
      'scope': instance.scope,
      'hallticketNumber': instance.hallticketNumber,
      'designation': instance.designation,
    };
