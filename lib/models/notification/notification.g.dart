// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Notification _$_$_NotificationFromJson(Map<String, dynamic> json) {
  return _$_Notification(
    title: json['title'] as String,
    description: json['description'] as String,
    author: json['author'] as String,
    time: DateTime.parse(json['time'] as String),
    designation: json['designation'] as String?,
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'author': instance.author,
      'time': instance.time.toIso8601String(),
      'designation': instance.designation,
    };
