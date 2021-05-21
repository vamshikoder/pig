// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$_$_EventFromJson(Map<String, dynamic> json) {
  return _$_Event(
    eventName: json['eventName'] as String,
    host: json['host'] as String,
    descripton: json['descripton'] as String?,
    from: DateTime.parse(json['from'] as String),
    to: json['to'] == null ? null : DateTime.parse(json['to'] as String),
  );
}

Map<String, dynamic> _$_$_EventToJson(_$_Event instance) => <String, dynamic>{
      'eventName': instance.eventName,
      'host': instance.host,
      'descripton': instance.descripton,
      'from': instance.from.toIso8601String(),
      'to': instance.to?.toIso8601String(),
    };
