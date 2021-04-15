import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../../../../data/dummie_recommended_books.dart';

import '../../../../../models/book/book.dart';

import '../book_Screen/book_screen.dart';

import './extended_book_card.dart';

class RecommendedBooks extends StatelessWidget {
  const RecommendedBooks({
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
        children: recommendedBooks.map(
          (val) {
            return ExtendedBookCard(
              onTap: () {
                Get.to(
                  () => BookScreen(book: val),
                );
              },
              book: Book(
                bookCode: val.bookCode,
                bookName: val.bookName,
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
