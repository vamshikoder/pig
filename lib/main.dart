import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './screens/home/ui/home.dart';
import 'screens/home/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // debugShowMaterialGrid: true,
      debugShowCheckedModeBanner: false,
      title: 'PIG',
      home: Home(),
    );
  }
}
