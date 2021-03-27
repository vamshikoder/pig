import 'package:flutter/material.dart';

import './config.dart';

const Color primaryColor = Color.fromRGBO(146, 221, 234, 1);
const Color secondaryColor = Colors.greenAccent;
const Color lightBlack = Color.fromRGBO(85, 93, 80, 1);
Color backgroundColor = Colors.grey.shade900;

const BoxShadow darkBoxShadow = BoxShadow(
  // color: Colors.black26,
  blurRadius: 6,
  offset: Offset(0, 3),
);

const List<BoxShadow> neumorphicShadow = [
  BoxShadow(
      offset: Offset(5, 5),
      color: Colors.black38,
      blurRadius: 14,
      spreadRadius: 1),
  BoxShadow(
    offset: Offset(-5, -5),
    color: Colors.white60,
    blurRadius: 14,
  ),
];

BoxDecoration cardDecoration({Color color = Colors.white}) {
  return BoxDecoration(
    color: color,
    borderRadius: BorderRadius.circular(borderRadius),
    boxShadow: neumorphicShadow,
  );
}

const LinearGradient gradient = LinearGradient(
    begin: Alignment(-1.0, -4.0),
    end: Alignment(1.0, 4.0),
    colors: [
      Color(0xFF5bc6ff),
      Color(0xFF4da7db),
    ]);
