import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../../../data/dummie_recent_books_data.dart';

import '../book_view/book_view.dart';

import './extended_book_card.dart';

class RecentBooks extends StatelessWidget {
  const RecentBooks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.39,
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
                () => BookView(book: val.book),
                transition: Transition.leftToRightWithFade,
              );
            },
            book: val.book,
            time: val.time,
          );
        }).toList(),
      ),
    );
  }
}
