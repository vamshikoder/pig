//~ These manage the state of the library module
//& Made by PIG
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/dummie_books_data.dart';
import '../../../models/book/book.dart';

/// These help for searching for the books by sending request to the server.
class SearchResultsNotifier extends StateNotifier<List<Book>> {
  SearchResultsNotifier() : super([]);

  void initSearchResults() {
    state.clear();
  }

  String updateSearchResults(String value, String recentSearch) {
    if (!value.contains(recentSearch)) {
      state.clear();
    }
    //* books = get from the server by sending id (email) according to the value from the search. do the search thing in the sever and get the books
    //* with the value in the book name.
    state = books
        .where(
          (book) => book.bookName.toLowerCase().contains(value),
        )
        .toList();
    return value;
  }
}

final searchResultsStateProvider =
    StateNotifierProvider<SearchResultsNotifier>((ref) {
  return SearchResultsNotifier();
});

/// [recentSearchStateProvider] contains the pervious search term which is used to
/// compare with the current search term.
final recentSearchStateProvider = StateProvider<String>((ref) {
  return "";
});

void updateRecentSearch(BuildContext context, String value) {
  context.read(recentSearchStateProvider).state = value;
}

/// [RecommendedBooksNotifier] configures the the recommended books from the server
/// it does not store these in the [local]

class RecommendedBooksNotifier extends StateNotifier<List<Book>> {
  RecommendedBooksNotifier() : super([]);
  void initRecommendedBooks() {
    //* get fromServer by sending the id (email) according to the branch the user is associated to.
  }
}

final recommendedBooksStateProvider =
    StateNotifierProvider<RecommendedBooksNotifier>((ref) {
  return RecommendedBooksNotifier();
});

class RecentBooksNotifier extends StateNotifier<List<Book>> {
  RecentBooksNotifier() : super([]);
  void initRecentBooks() {
    //* get fromServer by sending the id (email) and requesting for recent books.
  }
}

final recentBooksStateProvider =
    StateNotifierProvider<RecentBooksNotifier>((ref) {
  return RecentBooksNotifier();
});
