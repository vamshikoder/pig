//& Made by PIG

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/book/book.dart';
part 'borrowed_book.freezed.dart';
part 'borrowed_book.g.dart';

@freezed
class BorrowedBook with _$BorrowedBook {
  const factory BorrowedBook({
    required String email,
    required Book book,
    required DateTime startTime,
  }) = _BorrowedBook;

  factory BorrowedBook.fromJson(Map<String, dynamic> json) =>
      _$BorrowedBookFromJson(json);
}
