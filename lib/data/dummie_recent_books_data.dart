import '/models/book/book.dart';
import '/models/borrowed_book/borrowed_book.dart';

final List<BorrowedBook> recentBooks = [
  BorrowedBook(
    email: 'vamshikrishna.kar@gmail.com',
    book: const Book(
      bookName:
          'Principles, Techniques and Tools, Second Edition, Alfred V. Aho, Monica S. Lam, Ravi Sethi, Jeffry D. Ullman, Pearson',
      bookCode: 'somecode',
    ),
    startTime: DateTime.now(),
  ),
  BorrowedBook(
    email: 'vamshikrishna.kar@gmail.com',
    book: const Book(
      bookName: 'mechnaical',
      bookCode: 'ksf98',
    ),
    startTime: DateTime.now(),
  ),
  BorrowedBook(
    email: 'vamshikrishna.kar@gmail.com',
    book: const Book(
      bookName: 'elecritcal',
      bookCode: 'jk8sf',
    ),
    startTime: DateTime.now(),
  ),
  BorrowedBook(
    email: 'vamshikrishna.kar@gmail.com',
    book: const Book(
      bookName: 'mbbs',
      bookCode: '13sfs',
    ),
    startTime: DateTime.now(),
  ),
  BorrowedBook(
    email: 'vamshikrishna.kar@gmail.com',
    book: const Book(
      bookName: 'scientist',
      bookCode: 'fsd3sf',
    ),
    startTime: DateTime.now(),
  ),
  BorrowedBook(
    email: 'vamshikrishna.kar@gmail.com',
    book: const Book(
      bookName: 'aminator',
      bookCode: '33sfs',
    ),
    startTime: DateTime.now(),
  ),
];
