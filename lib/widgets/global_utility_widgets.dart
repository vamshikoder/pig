import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/config.dart';

class CContainer extends StatelessWidget {
  final Color color;
  final Widget child;

  const CContainer({Key key, @required this.child, this.color = white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: rSHeight(125),
      width: rSWidth(125),
      decoration: BoxDecoration(
        color: color,
        borderRadius: lightBorderRadius,
        boxShadow: lightBoxShadow,
      ),
      child: child,
    );
  }
}

class PigArrow extends StatelessWidget {
  final double turns;

  const PigArrow({Key key, @required this.turns}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: turns.toInt(),
      child: const Icon(
        Icons.arrow_back_ios_rounded,
        color: primaryColor,
        size: 15,
      ),
    );
  }
}

class PContainer extends StatelessWidget {
  final Widget child;

  const PContainer({Key key, @required this.child}) : super(key: key);
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

class Sheet extends StatelessWidget {
  final String title;
  final double height;
  final bool arrowVisible;
  final double turns;
  final Widget child;

  const Sheet({
    Key key,
    @required this.title,
    @required this.arrowVisible,
    @required this.child,
    this.turns,
    this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double _screenWidth = Get.width;

    return Container(
      width: _screenWidth,
      height: height,
      decoration: const BoxDecoration(
        color: white,
        borderRadius: lightBorderRadius,
        boxShadow: boxShadow,
      ),
      child: PContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vSpacer(factor: 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                heading1(title, color: black),
                // hSpacer(),
                if (arrowVisible) PigArrow(turns: turns) else const SizedBox()
              ],
            ),
            vSpacer(factor: 0.5),
            child,
          ],
        ),
      ),
    );
  }
}

class CustomScreen extends StatelessWidget {
  final List<Widget> rightChildren;
  final List<Widget> bottomChildren;
  final String title;
  final Widget body;
  final bool backArrowVisible;
  final Function backArrow;

  const CustomScreen({
    Key key,
    @required this.rightChildren,
    @required this.body,
    @required this.title,
    this.bottomChildren,
    this.backArrow,
    this.backArrowVisible = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        vSpacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (backArrowVisible)
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: hPadding(0.25)),
                    child: InkWell(
                      focusColor: transparent,
                      splashColor: transparent,
                      highlightColor: transparent,
                      onTap: () {
                        backArrow();
                      },
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: primaryColor,
                        size: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: hPadding(0.20)),
                    child: Container(
                      color: white,
                      child: heading('home'),
                    ),
                  ),
                ],
              )
            else
              Padding(
                padding: EdgeInsets.only(
                  left: hPadding(0.95),
                ),
                child: Container(
                  color: white,
                  child: heading('home'),
                ),
              ),
            Padding(
              padding: EdgeInsets.only(right: hPadding(0.5)),
              child: Row(
                children: rightChildren,
              ),
            ),
          ],
        ),
        PContainer(
          child: Column(children: bottomChildren),
        ),
        vSpacer(factor: 0.5),
        body,
      ],
    );
  }
}
