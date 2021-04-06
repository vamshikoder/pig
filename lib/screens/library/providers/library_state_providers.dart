// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/dummie_books_data.dart';
import '../../../models/book_model.dart';

class SearchResultsNotifier extends StateNotifier<List<Book>> {
  SearchResultsNotifier() : super([]);
  String updateSearchResults(String value, String recentSearch) {
    if (!value.contains(recentSearch)) {
      state.clear();
    }
    state = books
        .where(
          (book) => book.bookName.toLowerCase().contains(value),
        )
        .toList();
    // final List<String> temp = [];
    // for (final Book item in state) {
    //   temp.add(item.bookName);
    // }
    // log(temp.toString(), name: "book name");
    // log("\n");
    return value;
  }
}

final searchResultsStateProvider =
    StateNotifierProvider<SearchResultsNotifier>((ref) {
  return SearchResultsNotifier();
});

final recentSearchStateProvider = StateProvider<String>((ref) {
  return "";
});

void updateRecentSearch(BuildContext context, String value) {
  context.read(recentSearchStateProvider).state = value;
}
