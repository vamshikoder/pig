// GENERATED CODE - DO NOT MODIFY BY HAND
//ignore_for_file:non_constant_identifier_names
part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Notification _$_$_NotificationFromJson(Map<String, dynamic> json) {
  return _$_Notification(
    title: json['title'] as String,
    description: json['description'] as String,
    author: json['author'] as String,
    time: DateTime.parse(json['time'] as String),
    designation: json['designation'] as String?,
  );
}

Map<String, dynamic> _$_$_NotificationToJson(_$_Notification instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'author': instance.author,
      'time': instance.time.toIso8601String(),
      'designation': instance.designation,
    };
