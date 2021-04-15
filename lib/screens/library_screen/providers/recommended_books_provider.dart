import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pig/models/book/book.dart';

class RecommendedNotifier extends StateNotifier<List<Book>> {
  RecommendedNotifier()
      : super([
          const Book(
            bookName: '',
            bookCode: '',
          ),
        ]);
}

final recommendedStateProvider =
    StateNotifierProvider<RecommendedNotifier>((ref) {
  return RecommendedNotifier();
});
