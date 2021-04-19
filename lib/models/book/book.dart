//& Made by PIG
import 'package:freezed_annotation/freezed_annotation.dart';

part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  @Assert('(bookName != " ") & (bookName != "")', 'bookName cannot be  empty')
  @Assert('(bookCode != " ") & (bookCode != "")', 'bookCode cannot be empty')
  const factory Book({
    required String bookName,
    required String bookCode,
    @Default(0) int? remainingCopies,
    @Default([]) List<String>? contents,
  }) = _Book;
  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
