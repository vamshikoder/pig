//~ Contains all the Color Themes for PIG
//& Made by PIG

import 'package:flutter/material.dart';

const Color primaryColor = Color.fromRGBO(123, 237, 141, 1);
const Color errorColor = Color.fromRGBO(240, 20, 47, 1);
const Color white = Colors.white;
const Color black = Colors.black;
const Color transparent = Colors.transparent;
const grey = Color.fromRGBO(126, 132, 163, 1);

const List<BoxShadow> boxShadow = [
  BoxShadow(
    offset: Offset(0, 5),
    color: Colors.black12,
    blurRadius: 25,
    spreadRadius: 2,
  ),
];

const List<BoxShadow> lightBoxShadow = [
  BoxShadow(
    offset: Offset(0, 3),
    color: Colors.black12,
    blurRadius: 10,
    spreadRadius: 0.5,
  ),
];
