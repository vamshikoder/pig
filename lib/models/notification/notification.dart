//& Made by PIG

// class Notification {
//   ///[title] max [30] characters
//   final String title;
//   final DateTime time;

//   ///[description] max [600] characters
//   final String description;
//   final String author;
//   final String? designation;

//   Notification({
//     required this.title,
//     required this.time,
//     required this.description,
//     required this.author,
//     this.designation = "",
//   });
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  const factory Notification({
    required String title,
    required String description,
    required String author,
    required DateTime time,
    String? designation,
  }) = _Notification;
  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);
}
