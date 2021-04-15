import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import '../../../../config/config.dart';

import '../../../../widgets/global_utility_widgets.dart';
import '../../../../widgets/pig_search_bar.dart';

import '../../providers/library_state_providers.dart';

import './book_screen/book_screen.dart';

import './books/book_card.dart';

final TextEditingController librarySearchController = TextEditingController();

class SearchResults extends ConsumerWidget {
  const SearchResults({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final recentSearchState = watch(recentSearchStateProvider).state;
    final searchResultsState = watch(searchResultsStateProvider.state);
    return PigSheet(
      title: 'search results',
      height: rSHeight(300),
      child: Column(
        children: [
          PigSearchBar(
            controller: librarySearchController,
            hintText: "search books",
            displayIcon: DisplayIcon.search,
            sizeFactor: SizeFactor.none,
            onChanged: (value) {
              updateRecentSearch(
                context,
                context
                    .read(searchResultsStateProvider)
                    .updateSearchResults(value, recentSearchState),
              );
            },
          ),
          SingleChildScrollView(
            clipBehavior: Clip.none,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: searchResultsState.isNotEmpty
                  ? searchResultsState.map((val) {
                      return BookCard(
                        key: ObjectKey(val),
                        onTap: () {
                          Get.to(
                            () => BookScreen(book: val),
                          );
                        },
                        book: val,
                      );
                    }).toList()
                  : librarySearchController.text.isEmpty
                      ? const [
                          Center(
                            child: SubText(
                              'Start typing, look into the library',
                            ),
                          )
                        ]
                      : const [
                          Center(
                            child: SubText(
                              'Book Not Found, please try again later',
                              color: errorColor,
                            ),
                          ),
                        ],
            ),
          ),
        ],
      ),
    );
  }
}
