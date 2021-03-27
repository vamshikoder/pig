import 'package:flutter/material.dart';
import 'package:get/get.dart';

final double _screenHeight = Get.height;
final double _screenWidth = Get.width;
const double _defaultPadding = 40.0;

const constScreenWidth = 392;
const constScreenHeight = 781;

const BorderRadius deepBorderRadius = BorderRadius.all(
  Radius.circular(25.0),
);
const BorderRadius lightBorderRadius = BorderRadius.all(
  Radius.circular(12.50),
);
// gets relative screen width so that app look the same every where
double rSHeight(double factor) {
  final double screenHeight = _screenHeight;
  return factor * screenHeight / constScreenHeight;
}

double rSWidth(double factor) {
  final double screenWidth = _screenWidth;
  return factor * screenWidth / constScreenWidth;
}

// returns a double and gets relative padding
double hPadding(double factor) {
  return _defaultPadding * factor * _screenWidth / constScreenWidth;
}

double vPadding(double factor) {
  return _defaultPadding * factor * _screenHeight / constScreenHeight;
}

// sized box with padding
Widget vSpacer({double factor = 1}) {
  return SizedBox(
    height: (_defaultPadding * _screenHeight / constScreenHeight) * factor,
  );
}

Widget hSpacer({double factor = 1}) {
  return SizedBox(
    width: (_defaultPadding * _screenWidth / constScreenWidth) * factor,
  );
}
