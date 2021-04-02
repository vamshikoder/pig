import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './screens/home/ui/home.dart';
import 'screens/home/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /// [MaterialApp] extension so that navigation is simple pass [Get.to(Page())] for navigation
      debugShowCheckedModeBanner: false,
      title: 'PIG',
      home: Home(),
    );
  }
}
