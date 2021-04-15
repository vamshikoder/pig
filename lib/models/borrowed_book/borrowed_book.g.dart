// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrowed_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************
// ignore: non_constant_identifier_names
_$_BorrowedBook _$_$_BorrowedBookFromJson(Map<String, dynamic> json) {
  return _$_BorrowedBook(
    email: json['email'] as String,
    book: Book.fromJson(json['book'] as Map<String, dynamic>),
    time: DateTime.parse(json['time'] as String),
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_BorrowedBookToJson(_$_BorrowedBook instance) =>
    <String, dynamic>{
      'email': instance.email,
      'book': instance.book,
      'time': instance.time.toIso8601String(),
    };
