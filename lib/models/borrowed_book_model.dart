//& Made by PIG

import 'package:pig/models/book_model.dart';

class BorrowedBook {
  final String email;
  final Book book;
  final DateTime time;

  BorrowedBook({
    required this.email,
    required this.book,
    required this.time,
  });
}
