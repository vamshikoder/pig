import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import '../../../config/config.dart';

import '../../../widgets/global_utility_widgets.dart';
import '../../../widgets/pig_stacked_sheet.dart';

import './components/books/recent_books.dart';
import './components/books/recommended_books.dart';
import './components/search_results.dart';

class LibraryScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return PigKeyboardDismissiableWrapper(
      child: PigCustomScaffold(
        title: 'library',
        backArrowTap: () {
          Get.back();
        },
        body: Expanded(
          child: Stack(
            children: [
              const Positioned(
                top: -10,
                child: SearchResults(),
              ),
              // Spacer(),
              Positioned(
                top: rSHeight(280),
                child: const PigStackedSheets(
                  title1: 'recommended',
                  title2: 'recents',
                  child1: RecommendedBooks(),
                  child2: RecentBooks(),
                  heightFactor: 0.45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
