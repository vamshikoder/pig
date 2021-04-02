import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config.dart';
import 'global_utility_widgets.dart';

class StackedSheets extends StatefulWidget {
  ///[title1] is the title of the first sheet
  final String title1;

  ///[title2] is the title of the first sheet
  final String title2;

  ///[child1] provide child to the [sheet1]
  final Widget child1;

  ///[child2] provide child to the [sheet2]
  final Widget child2;

  final double heightFactor;

  const StackedSheets({
    Key? key,
    required this.title1,
    required this.title2,
    required this.child1,
    required this.child2,
    required this.heightFactor,
  }) : super(key: key);

  @override
  _StackedSheetsState createState() => _StackedSheetsState();
}

class _StackedSheetsState extends State<StackedSheets> {
  static const _animationDuration = Duration(milliseconds: 250);
  final double _screenWidth = Get.width;
  final double _screenHeight = Get.height;

  double _angle1 = 0 * pi / 180;
  double _angle2 = 180 * pi / 180;

  double top = rSHeight(60);

  void forward() {
    setState(() {
      _angle1 = 180 * pi / 180;
      _angle2 = 0 * pi / 180;
      top = _screenHeight * widget.heightFactor;
    });
  }

  void reverse() {
    setState(() {
      _angle1 = 0 * pi / 180;
      _angle2 = 180 * pi / 180;
      top = rSHeight(60);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_angle1 > 0) {
          reverse();
        } else {
          forward();
        }
      },
      child: LimitedBox(
        maxHeight: _screenHeight * 0.8,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: _screenWidth,

              ///[25.0] is to overflow the [sheet1] into the below [sheet2]
              height: _screenHeight * widget.heightFactor + 25.0,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: lightBorderRadius,
                boxShadow: boxShadow,
              ),
              child: PContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VSpacer(sizeFactor: SizeFactor.half),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Heading1(widget.title1, color: black),
                        AnimatedContainer(
                          duration: _animationDuration,
                          child: Transform.rotate(
                            angle: _angle1,
                            child: const PigArrow(turns: 1),
                          ),
                        )
                      ],
                    ),
                    const VSpacer(sizeFactor: SizeFactor.half),
                    widget.child1,
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              top: top,
              // bottom: 60,
              duration: _animationDuration,
              child: Container(
                width: _screenWidth,
                height: _screenHeight,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: lightBorderRadius,
                  boxShadow: boxShadow,
                ),
                child: PContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VSpacer(sizeFactor: SizeFactor.half),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Heading1(widget.title2, color: black),
                          Transform.rotate(
                            angle: _angle2,
                            child: const PigArrow(turns: 1),
                          ),
                        ],
                      ),
                      const VSpacer(sizeFactor: SizeFactor.half),
                      widget.child2,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
