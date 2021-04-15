//& Made by PIG

import 'package:pig/models/book/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'borrowed_book.freezed.dart';
part 'borrowed_book.g.dart';

// class BorrowedBook {
//   final String email;
//   final Book book;
//   final DateTime time;

//   BorrowedBook({
//     required this.email,
//     required this.book,
//     required this.time,
//   });
// }

@freezed
class BorrowedBook with _$BorrowedBook {
  const factory BorrowedBook({
    required String email,
    required Book book,
    required DateTime time,
  }) = _BorrowedBook;

  factory BorrowedBook.fromJson(Map<String, dynamic> json) =>
      _$BorrowedBookFromJson(json);
}
