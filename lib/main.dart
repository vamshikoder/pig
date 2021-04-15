import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import './data/dummie_books_data.dart';
import 'screens/library_screen/ui/components/book_screen/book_screen.dart';
// import './screens/home/ui/home.dart';

void main() => runApp(ProviderScope(child: PigApp()));

//* This is the PigApp workspace use this for development.
class PigApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /// [MaterialApp] extension so that navigation is simple pass [Get.to(Page())] for navigation
      debugShowCheckedModeBanner: false,
      title: 'PIG',
      home: BookScreen(
        book: books[0],
      ),
    );
  }
}

//! this will the final PigApp class donot use this.
// class PigApp extends StatelessWidget {
//   final Future _initFuture = Init.initialize();
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       /// [MaterialApp] extension so that navigation is simple pass [Get.to(Page())] for navigation
//       debugShowCheckedModeBanner: false,
//       title: 'PIG',
//       home: FutureBuilder(
//         future: _initFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             // if (signined) {
//             //   return Home();
//             // } else {
//             //   return Signin();
//             // }
//             return Home();
//           } else {
//             return SplashScreen();
//           }
//         },
//       ),
//     );
//   }
// }
