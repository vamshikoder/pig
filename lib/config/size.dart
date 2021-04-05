import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

final double _screenHeight = Get.height;
final double _screenWidth = Get.width;
const double _defaultPadding = 40.0;

///[PIXEL 4XL] size 411 / 820
const constScreenWidth = 400.0;
const constScreenHeight = 800.0;

const BorderRadius deepBorderRadius = BorderRadius.all(
  Radius.circular(25.0),
);
const BorderRadius lightBorderRadius = BorderRadius.all(
  Radius.circular(12.50),
);
// gets relative screen width so that app look the same every where
double rSHeight(double height) {
  final double screenHeight = _screenHeight;
  return height * screenHeight / constScreenHeight;
}

double rSWidth(double width) {
  final double screenWidth = _screenWidth;
  return width * screenWidth / constScreenWidth;
}

// returns a double and gets relative padding
double hPadding(double factor) {
  return _defaultPadding * factor * _screenWidth / constScreenWidth;
}

double vPadding(double factor) {
  return _defaultPadding * factor * _screenHeight / constScreenHeight;
}

class VSpacer extends StatelessWidget {
  final SizeFactor? sizeFactor;

  const VSpacer({Key? key, this.sizeFactor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double _factor;
    switch (sizeFactor) {
      case SizeFactor.full:
        _factor = 1;
        break;
      case SizeFactor.half:
        _factor = 0.5;
        break;
      case SizeFactor.quater:
        _factor = 0.25;
        break;
      default:
        _factor = 1;
    }
    return SizedBox(
      height: (_defaultPadding * _screenHeight / constScreenHeight) * _factor,
    );
  }
}

class HSpacer extends StatelessWidget {
  final SizeFactor? sizeFactor;

  const HSpacer({Key? key, this.sizeFactor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _factor;
    switch (sizeFactor) {
      case SizeFactor.full:
        _factor = 1;
        break;
      case SizeFactor.half:
        _factor = 0.5;
        break;
      case SizeFactor.quater:
        _factor = 0.25;
        break;
      default:
        _factor = 1;
    }

    return SizedBox(
      width: (_defaultPadding * _screenWidth / constScreenWidth) * _factor,
    );
  }
}

enum SizeFactor { full, half, quater }
