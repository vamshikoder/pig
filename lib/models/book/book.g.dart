// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: non_constant_identifier_names

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$_$_BookFromJson(Map<String, dynamic> json) {
  return _$_Book(
    bookName: json['bookName'] as String,
    bookCode: json['bookCode'] as String,
    remainingCopies: json['remainingCopies'] as int? ?? 0,
    contents: (json['contents'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_BookToJson(_$_Book instance) => <String, dynamic>{
      'bookName': instance.bookName,
      'bookCode': instance.bookCode,
      'remainingCopies': instance.remainingCopies,
      'contents': instance.contents,
    };
