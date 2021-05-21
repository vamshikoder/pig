//& Made by PIG

// class Event {
//   Event({
//     required this.eventName,
//     required this.from,
//     required this.host,
//     this.to,
//   });

//   String eventName;
//   String host;
//   DateTime from;
//   DateTime? to;
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    required String eventName,
    required String host,
    String? descripton,
    required DateTime from,
    DateTime? to,
  }) = _Event;
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
