import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget puppetLogo({Color color = Colors.black}) {
  return Text(
    'puppet',
    style: GoogleFonts.pacifico(
      shadows: [
        Shadow(
          color: Colors.black26,
          blurRadius: 3,
          offset: Offset(0, 4),
        )
      ],
      color: color,
      wordSpacing: 2.0,
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

final TextStyle defaultTextStyle = GoogleFonts.comfortaa(
  color: Colors.black,
  fontSize: 15.0,
  fontWeight: FontWeight.normal,
);

Widget heading1(String text, {Color color = Colors.black}) {
  return Text(
    text.toUpperCase(),
    style: GoogleFonts.comfortaa(
      color: color,
      fontSize: 25.0,
      fontWeight: FontWeight.w900,
    ),
  );
}

Widget heading2(String text, {Color color = Colors.black}) {
  return Text(
    text,
    style: GoogleFonts.comfortaa(
      color: color,
      fontSize: 15.0,
      fontWeight: FontWeight.w500,
    ),
  );
}
