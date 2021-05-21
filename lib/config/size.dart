//~ This contains preconfigured Size which can be used
//~ so that the application looks the same on all the
//~ devices developer mobile used is PIXEL 4XL
//& Made by PIG

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

final double screenHeight = Get.height;
final double screenWidth = Get.width;
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
  final double sh = screenHeight;
  return height * sh / constScreenHeight;
}

double rSWidth(double width) {
  final double sw = screenWidth;
  return width * sw / constScreenWidth;
}

// returns a double and gets relative padding
double hPadding(double factor) {
  return _defaultPadding * factor * screenWidth / constScreenWidth;
}

double vPadding(double factor) {
  return _defaultPadding * factor * screenHeight / constScreenHeight;
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
      case SizeFactor.min:
        _factor = 0.12;
        break;
      default:
        _factor = 1;
    }
    return SizedBox(
      height: (_defaultPadding * screenHeight / constScreenHeight) * _factor,
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
      case SizeFactor.min:
        _factor = 0.12;
        break;
      default:
        _factor = 1;
    }

    return SizedBox(
      width: (_defaultPadding * screenWidth / constScreenWidth) * _factor,
    );
  }
}

enum SizeFactor { full, half, quater, min, none }
