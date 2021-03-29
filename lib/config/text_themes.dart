import 'package:flutter/material.dart';
import 'colors.dart';

Widget heading(String text, {Color color = primaryColor}) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontSize: 30,
      fontWeight: FontWeight.w900,
      letterSpacing: 5,
    ),
  );
}

Widget heading1(String text, {Color color = greyColor}) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 2.5,
    ),
  );
}

Widget heading2(String text, {Color color = greyColor}) {
  return Text(
    text.toUpperCase(),
    style: TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      letterSpacing: 2.5,
    ),
  );
}

Widget subText(String text,
    {Color color = greyColor, double letterSpacing = 1}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: letterSpacing,
    ),
  );
}

Widget subTitle(String text,
    {Color color = greyColor, double letterSpacing = 2.5}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontFamily: 'Poppins',
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: letterSpacing,
    ),
  );
}
