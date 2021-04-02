import 'package:flutter/material.dart';
import 'colors.dart';

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
      style: TextStyle(
        color: color,
        fontFamily: 'Poppins',
        fontSize: 30,
        fontWeight: FontWeight.w900,
        letterSpacing: 4,
      ),
    );
  }
}

///[Heading1] used for sub headings or in-body content headings
class Heading1 extends StatelessWidget {
  final String text;
  final Color color;
  const Heading1(this.text, {Key? key, this.color = greyColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

///[Heading2] can be used as in-body sub headings
class Heading2 extends StatelessWidget {
  final String text;
  final Color color;
  const Heading2(this.text, {Key? key, this.color = greyColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

///[SubText] this is used to show the app contents basic [Text] should be shown
///using [SubText] widget
class SubText extends StatelessWidget {
  final String text;
  final Color color;
  final double letterSpacing;
  const SubText(this.text,
      {Key? key, this.color = primaryColor, this.letterSpacing = 1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
}

///use [SubTitle] for [Text] that needs less preference.
class SubTitle extends StatelessWidget {
  final String text;
  final Color color;
  final double letterSpacing;
  const SubTitle(this.text,
      {Key? key, this.color = primaryColor, this.letterSpacing = 1})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
}
