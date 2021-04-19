//~ This contains preconfigured text Themes for PIG
//& Made by PIG

import 'package:flutter/material.dart';

import 'colors.dart';
import 'size.dart';

///[Heading] mainly used for screen name
class Heading extends StatelessWidget {
  final String text;
  final Color color;
  const Heading(this.text, {Key? key, this.color = primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      textScaleFactor: screenWidth / constScreenWidth,
      style: TextStyle(
        color: color,
        fontFamily: 'Poppins',
        fontSize: 30,
        fontWeight: FontWeight.w900,
        letterSpacing: 2,
      ),
    );
  }
}

///[Heading1] used for sub headings or in-body content headings
class Heading1 extends StatelessWidget {
  final String text;
  final Color color;
  const Heading1(
    this.text, {
    Key? key,
    this.color = grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      overflow: TextOverflow.fade,
      textScaleFactor: screenWidth / constScreenWidth,
      style: TextStyle(
        color: color,
        fontFamily: 'Poppins',
        fontSize: 23,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
      ),
    );
  }
}

///[Heading2] can be used as in-body sub headings
class Heading2 extends StatelessWidget {
  final String text;
  final Color color;
  final double? letterSpacing;
  const Heading2(
    this.text, {
    Key? key,
    this.color = grey,
    this.letterSpacing = 2.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      textScaleFactor: screenWidth / constScreenWidth,
      style: TextStyle(
        color: color,
        fontFamily: 'Poppins',
        fontSize: 18,
        fontWeight: FontWeight.w600,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

///[SubText] this is used to show the app contents basic [Text] should be shown
///using [SubText] widget
class SubText extends StatelessWidget {
  final String text;
  final Color color;
  final double letterSpacing;
  final bool? bold;
  const SubText(
    this.text, {
    Key? key,
    this.color = primaryColor,
    this.letterSpacing = 1,
    this.bold = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.fade,
      maxLines: 2,
      textScaleFactor: screenWidth / constScreenWidth,
      style: TextStyle(
        color: color,
        // fontFamily: 'Poppins',
        fontSize: 15,
        fontWeight: bold! ? FontWeight.bold : FontWeight.w400,
        letterSpacing: letterSpacing,
      ),
    );
  }
}

///use [SubTitle] for [Text] that needs less preference.
class SubTitle extends StatelessWidget {
  final String text;
  final Color color;
  final double letterSpacing;
  final bool? bold;
  const SubTitle(
    this.text, {
    Key? key,
    this.color = primaryColor,
    this.letterSpacing = 1,
    this.bold = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaleFactor: screenWidth / constScreenWidth,
      style: TextStyle(
        color: color,
        // fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: bold! ? FontWeight.bold : FontWeight.w400,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
