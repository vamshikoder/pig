// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    email: json['email'] as String,
    name: json['name'] as String,
    isAuthorized: json['isAuthorized'] as bool,
    scope: json['scope'] as String,
    year: json['year'] as int?,
    section: json['section'] as int?,
    hallticketNumber: json['hallticketNumber'] as String?,
    designation: json['designation'] as String?,
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'isAuthorized': instance.isAuthorized,
      'scope': instance.scope,
      'year': instance.year,
      'section': instance.section,
      'hallticketNumber': instance.hallticketNumber,
      'designation': instance.designation,
    };
