import 'package:flutter/material.dart';
import '../config/config.dart';

class CContainer extends StatelessWidget {
  final Color color;
  final Widget child;

  const CContainer({Key key, this.child, this.color = white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class PigArrow extends StatelessWidget {
  final double turns;

  const PigArrow({Key key, this.turns}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: turns.toInt(),
      child: const Icon(
        Icons.arrow_back_ios_rounded,
        color: primaryColor,
        size: 20,
      ),
    );
  }
}

class PContainer extends StatelessWidget {
  final Widget child;

  const PContainer({Key key, this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding(1),
      ),
      child: child,
    );
  }
}
