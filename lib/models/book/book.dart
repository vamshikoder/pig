//& Made by PIG

// class Book {
//   final String bookName;
//   final String bookCode;
//   final int? remainingCopies;
//   final List<String>? contents;
//   final bool? ownIt;

//   Book({
//     required this.bookName,
//     required this.bookCode,
//     this.contents,
//     this.remainingCopies,
//     this.ownIt,
//   });
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  const factory Book({
    required String bookName,
    required String bookCode,
    int? remainingCopies,
    List<String>? contents,
    bool? ownIt,
  }) = _Book;
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
