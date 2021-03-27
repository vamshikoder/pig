import 'package:flutter/material.dart';
import 'package:get/get.dart';

final double _screenHeight = Get.height;
final double _screenWidth = Get.width;
final double _defaultPadding = 40.0;
final double borderRadius = 50.0;

const constScreenWidth = 411.42857142857144;
const constScreenHeight = 820.5714285714286;

const BorderRadius deepBorderRadius = const BorderRadius.all(
  Radius.circular(50.0),
);
const BorderRadius lightBorderRadius = const BorderRadius.all(
  Radius.circular(25.0),
);

double getRelativeScreenHeight(double factor) {
  double screenHeight = _screenHeight;
  return factor * screenHeight / constScreenHeight;
}

double getRelativeScreenWidth(double factor) {
  double screenWidth = _screenWidth;
  return factor * screenWidth / constScreenWidth;
}

double getHorizontalPadding(double factor) {
  return (_defaultPadding * factor * _screenWidth / constScreenWidth);
}

double getVerticalPadding(double factor) {
  return (_defaultPadding * factor * _screenHeight / constScreenHeight);
}

Widget paddingContainer({
  @required Widget child,
  double hFactor = 1.0,
  double vFactor = 0.0,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: (_defaultPadding * _screenWidth / constScreenWidth) * hFactor,
      vertical: (_defaultPadding * _screenHeight / constScreenHeight) * vFactor,
    ),
    child: child,
  );
}

Widget verticalSpacer({double factor = 1}) {
  return SizedBox(
    height: (_defaultPadding * _screenHeight / constScreenHeight) * factor,
  );
}

Widget horizontalSpacer({double factor = 1}) {
  return SizedBox(
    width: (_defaultPadding * _screenWidth / constScreenWidth) * factor,
  );
}
