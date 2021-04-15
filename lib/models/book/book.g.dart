// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Book _$_$_BookFromJson(Map<String, dynamic> json) {
  return _$_Book(
    bookName: json['bookName'] as String,
    bookCode: json['bookCode'] as String,
    remainingCopies: json['remainingCopies'] as int?,
    contents:
        (json['contents'] as List<dynamic>?)?.map((e) => e as String).toList(),
    ownIt: json['ownIt'] as bool?,
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_BookToJson(_$_Book instance) => <String, dynamic>{
      'bookName': instance.bookName,
      'bookCode': instance.bookCode,
      'remainingCopies': instance.remainingCopies,
      'contents': instance.contents,
      'ownIt': instance.ownIt,
    };
