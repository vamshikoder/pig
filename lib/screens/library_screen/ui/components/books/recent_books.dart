import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pig/config/config.dart';

import '../../../../../data/dummie_recent_books_data.dart';

import '../book_Screen/book_screen.dart';

import './extended_book_card.dart';

class RecentBooks extends StatelessWidget {
  const RecentBooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.39,
      width: double.infinity,
      child: GridView(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        children: recentBooks.map((val) {
          return ExtendedBookCard(
            key: ObjectKey(val),
            onTap: () {
              Get.to(
                () => BookScreen(book: val.book),
                transition: Transition.leftToRightWithFade,
              );
            },
            book: val.book,
            time: val.startTime,
          );
        }).toList(),
      ),
    );
  }
}
