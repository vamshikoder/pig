import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import './screens/home/ui/home.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

        /// [MaterialApp] extension so that navigation is simple pass [Get.to(Page())] for navigation
        debugShowCheckedModeBanner: false,
        title: 'PIG',
        home: Home()
        //     BookView(
        //   book: books.first,
        // ),
        );
  }
}
