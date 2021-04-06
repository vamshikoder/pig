class Book {
  final String bookName;
  final String bookCode;
  final int? remainingCopies;
  final List<String>? contents;
  final bool? ownIt;

  Book({
    required this.bookName,
    required this.bookCode,
    this.contents,
    this.remainingCopies,
    this.ownIt,
  });
}
