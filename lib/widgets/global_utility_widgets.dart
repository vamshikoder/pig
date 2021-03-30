import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config.dart';

class CContainer extends StatelessWidget {
  /// [CContainer] is a basic [Container] with pre configured
  /// [Size] and [decoration]

  /// [color] specify the color of the [Container]
  final Color color;

  /// [child] is the contents in the [CContainer]
  final Widget child;

  const CContainer({Key? key, required this.child, this.color = white})
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
  ///[PigArrow] is a [icon] configured so that it can
  ///be used everywhere while changing [turns] parameter that changes [angle]
  ///of the icon

  ///[turns] is used to change the angle takes [double]
  final double turns;

  const PigArrow({Key? key, required this.turns}) : super(key: key);
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
  ///[PContainer] is a custom container for [PIG]
  ///with preconfigured [padding] for [PIG]

  ///[Pcontainer] takes [child] parameter to which
  ///needs [padding] to be applied
  final Widget child;

  const PContainer({Key? key, required this.child}) : super(key: key);
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
  ///[Sheet] creates a container with preconfigured [Theme] and [Size] settings
  ///can be configured as needed using the below [parameters]

  /// provide the [Sheet] with the [title] which can used to specify the [contents] below the [sheet]
  final String title;

  /// [height] determines the length of the [sheet].
  final double height;

  /// [arrowVisible] takes a [bool] value which can be shown in case of sheets that needs to be [opened] and [closed]
  final bool arrowVisible;

  /// [turns] determine the angle at which the arrow should be rotated
  final double turns;

  ///[child] this where all the [Widgets] under the [Sheet] should be written
  final Widget child;

  ///[sheetTap] allows to perform some actions on tap of the sheet.
  final Function? sheetTap;

  //TODO need to implement ontap sheet expansion
  const Sheet({
    Key? key,
    required this.title,
    required this.arrowVisible,
    required this.child,
    required this.turns,
    required this.height,
    this.sheetTap,
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
                Heading1(title, color: black),
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

class CustomScaffold extends StatelessWidget {
  ///[CustomScaffold] Should be used as the [body] of [Scaffold]
  ///this provides custom features which [AppBar] cannot provide.
  ///the App

  /// [head] acts like [AppBar] in [Scaffold] use this to add more elements to the top
  final List<Widget> head;

  ///[extendedHead] allows you to add more contents below [head]
  ///this is not necessary to write
  final List<Widget>? extendedHead;

  ///[title] describes the page that the user is in.
  final String? title;

  ///[body] is something similar to [body] in [Scaffold]
  final Widget body;

  ///[backArrowVisible] allows to show arrow so that it is easy to navigate to the proevious [screen]
  final bool backArrowVisible;

  ///this is a function which tells what to do when the [backArrow] is [tapped]
  ///this can be used to tell the app to go back to the [previous screen]
  final Function? backArrow;

  const CustomScaffold({
    Key? key,
    required this.head,
    required this.body,
    this.title,
    this.extendedHead,
    this.backArrowVisible = false,
    this.backArrow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _title = title ?? '';
    final List<Widget> _extendedHead = extendedHead ?? const [SizedBox()];
    return Scaffold(
      body: Column(
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
                          backArrow!();
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
                        child: Heading(_title),
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
                    child: Heading(_title),
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(right: hPadding(0.5)),
                child: Row(
                  children: head,
                ),
              ),
            ],
          ),
          PContainer(
            child: Column(children: _extendedHead),
          ),
          vSpacer(factor: 0.5),
          body,
        ],
      ),
    );
  }
}
