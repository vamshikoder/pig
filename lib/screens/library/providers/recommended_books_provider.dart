import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pig/models/book_model.dart';

class RecommendedNotifier extends StateNotifier<List<Book>> {
  RecommendedNotifier()
      : super([
          Book(
            bookName: '',
            bookCode: '',
          ),
        ]);
}

final recommendedStateProvider =
    StateNotifierProvider<RecommendedNotifier>((ref) {
  return RecommendedNotifier();
});
