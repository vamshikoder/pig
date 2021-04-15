import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import '../../../../../config/config.dart';

import '../../../../../models/book/book.dart';

import '../../../../../widgets/global_utility_widgets.dart';
import './content_card.dart';

class BookView extends ConsumerWidget {
  final Book book;

  const BookView({
    Key? key,
    required this.book,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return PigCustomScaffold(
      title: 'Book',
      backArrowTap: () {
        Get.back();
      },
      body: Expanded(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: rSHeight(10),
              child: PigSheet(
                height: rSHeight(260),
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        book.bookName,
                        style: TextStyle(
                          color: black,
                          fontFamily: 'Poppins',
                          fontSize: rSHeight(20),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const VSpacer(
                            sizeFactor: SizeFactor.quater,
                          ),
                          SizedBox(
                            width: rSWidth(150),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SubTitle("18 Jun 2021"),
                                SubTitle(
                                  book.bookCode,
                                  color: grey,
                                  bold: true,
                                ),
                              ],
                            ),
                          ),
                          const VSpacer(
                            sizeFactor: SizeFactor.quater,
                          ),
                          Row(
                            children: [
                              const SubText(
                                "Remaining Copies:  ",
                                bold: true,
                              ),
                              SubText(
                                "${book.remainingCopies}",
                                bold: true,
                                color: black,
                              ),
                            ],
                          ),
                          const VSpacer(
                            sizeFactor: SizeFactor.full,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: rSHeight(250),
              child: PigSheet(
                title: 'contents',
                height: Get.height * 0.58,
                child: Expanded(
                  child: SingleChildScrollView(
                    clipBehavior: Clip.antiAlias,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        returndummie(),
                        returndummie(),
                        returndummie(),
                        returndummie(),
                        returndummie(),
                        returndummie(),
                        returndummie(),
                        returndummie(),
                        returndummie(),
                        returndummie(),
                        const VSpacer(
                          sizeFactor: SizeFactor.full,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget returndummie() {
  return const ContentCard(
    title: 'chapter 1',
    content: [
      "1.1 Reasons for Studying Concepts of Programming Languages",
      "1.2 Programming Domains ",
      " 1.3 Language Evaluation Criteria ",
      "1.4 Influences on Language Design",
      "1.5 Language Categories",
      "1.6 Language Design Trade-Offs ",
      "1.7 Implementation Methods",
      "1.8 Programming Environments"
    ],
  );
}
