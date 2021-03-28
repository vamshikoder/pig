import 'package:flutter/material.dart';
import '../config/config.dart';

Widget cubeContainer(Widget child, {Color color = white}) {
  return Container(
    height: rSHeight(125),
    width: rSWidth(125),
    decoration: BoxDecoration(
      color: color,
      borderRadius: lightBorderRadius,
      boxShadow: boxShadow,
    ),
    child: child,
  );
}

Widget pigArrow(double turns) {
  return RotatedBox(
    quarterTurns: turns.toInt(),
    child: const Icon(
      Icons.arrow_back_ios_rounded,
      color: primaryColor,
      size: 20,
    ),
  );
}
