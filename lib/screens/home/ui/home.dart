import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/config.dart';
import '../../../widgets/global_utility_widgets.dart';
import '../../../widgets/stacked_sheet.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double _screenHeight = Get.height;
    return CustomScaffold(
      title: 'hello', // remove this line if you don't need a title
      /// similar to [AppBar] in [Scaffold]
      head: const [
        //your AppBar Widgets
      ],

      /// similar to [body] in [Scaffold]
      body:

          ///don't forget to import [stacked_sheets.dart] and [get.dart]
          StackedSheets(
        title1: 'title1',
        title2: 'title2',
        child1: const SubText('hello from title1'),
        child2: const SubText('hello from title2'),

        ///[height] factor must be [0.80] if is used as [body]
        ///if there is any other [Widget] above [StackedSheets] configure [height] accordingly
        ///don't forget to initialize [final double _screenHeight = Get.height;]
        height: _screenHeight * 0.50,
      ),
    );
  }
}
