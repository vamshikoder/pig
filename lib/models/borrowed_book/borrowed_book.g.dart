// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names

part of 'borrowed_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BorrowedBook _$_$_BorrowedBookFromJson(Map<String, dynamic> json) {
  return _$_BorrowedBook(
    email: json['email'] as String,
    book: Book.fromJson(json['book'] as Map<String, dynamic>),
    startTime: DateTime.parse(json['startTime'] as String),
  );
}

Map<String, dynamic> _$_$_BorrowedBookToJson(_$_BorrowedBook instance) =>
    <String, dynamic>{
      'email': instance.email,
      'book': instance.book,
      'startTime': instance.startTime.toIso8601String(),
    };
