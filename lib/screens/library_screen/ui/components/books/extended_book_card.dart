import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/config.dart';

import '../../../../../models/book/book.dart';

import '../../../../../utils/date_time.dart';

import '../../../../../widgets/global_utility_widgets.dart';

///import [flutter_riverpod.dart]
class ExtendedBookCard extends ConsumerWidget {
  final VoidCallback onTap;
  final DateTime? time;
  final Book book;
  const ExtendedBookCard({
    Key? key,
    required this.onTap,
    required this.book,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return GestureDetector(
      onTap: onTap,
      child: PigPaddingContainer(
        verticalPadding: true,
        sizeFactor: SizeFactor.quater,
        child: PigCube(
          // height: 125.0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: vPadding(0.25),
              horizontal: hPadding(0.5),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: hPadding(0.5)),
                  child: Text(
                    book.bookName,
                    overflow: TextOverflow.fade,
                    maxLines: 3,
                    style: const TextStyle(
                      color: black,
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                if (time != null)
                  SubText(
                    formattedDate(time),
                    color: grey,
                    bold: true,
                  )
                else
                  Container(),
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
