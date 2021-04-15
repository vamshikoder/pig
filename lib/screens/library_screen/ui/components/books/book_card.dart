import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pig/models/book/book.dart';

import '../../../../../config/config.dart';
import '../../../../../widgets/global_utility_widgets.dart';

class BookCard extends ConsumerWidget {
  final VoidCallback onTap;
  final Book book;
  const BookCard({
    Key? key,
    required this.onTap,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: hPadding(0.5)),
        child: PigCube(
          // height: 125.0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: vPadding(0.25),
              horizontal: hPadding(0.5),
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  book.bookName,
                  // notification.title,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  style: const TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                SubText(
                  book.bookCode,
                  color: grey,
                  bold: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
