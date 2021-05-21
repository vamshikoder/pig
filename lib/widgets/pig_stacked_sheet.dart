import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:pig/providers/user_state_provider.dart';

import '../config/config.dart';
import 'global_utility_widgets.dart';

final angleOneStateProvider = StateProvider<double>((ref) {
  return 0 * pi / 180;
});
final angleTwoStateProvider = StateProvider<double>((ref) {
  return 180 * pi / 180;
});

final heightStateProvider = StateProvider<double>((ref) {
  return rSHeight(60);
});
void forward1(BuildContext context, double heightFactor) {
  context.read(angleOneStateProvider).state = 180 * pi / 180;
  context.read(angleTwoStateProvider).state = 0 * pi / 180;
  context.read(heightStateProvider).state = Get.height * heightFactor;
}

void backward1(BuildContext context) {
  context.read(angleOneStateProvider).state = 0 * pi / 180;
  context.read(angleTwoStateProvider).state = 180 * pi / 180;
  context.read(heightStateProvider).state = rSHeight(60);
}

class PigStackedSheets extends ConsumerWidget {
  ///[title1] is the title of the first sheet
  final String title1;

  ///[title2] is the title of the first sheet
  final String title2;

  ///[child1] provide child to the [sheet1]
  final Widget child1;

  ///[child2] provide child to the [sheet2]
  final Widget child2;
  final double heightFactor;
  final IconData? icon;
  final VoidCallback? iconTap;

  const PigStackedSheets({
    Key? key,
    required this.title1,
    required this.title2,
    required this.child1,
    required this.child2,
    required this.heightFactor,
    this.icon,
    this.iconTap,
  }) : super(key: key);

  static const _animationDuration = Duration(milliseconds: 250);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final userState = watch(userStateProvider.state);
    final angleOneState = watch(angleOneStateProvider).state;
    final angleTwoState = watch(angleTwoStateProvider).state;
    final heightState = watch(heightStateProvider).state;
    final double _screenWidth = Get.width;
    final double _screenHeight = Get.height;

    return GestureDetector(
      onTap: () {
        if (angleOneState > 0) {
          backward1(context);
        } else {
          forward1(context, heightFactor);
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
              height: _screenHeight * heightFactor + 25.0,
              decoration: BoxDecoration(
                color: white,
                borderRadius: lightBorderRadius,
                boxShadow: boxShadow(),
              ),
              child: PigPaddingContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VSpacer(sizeFactor: SizeFactor.half),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Heading2(title1, color: black),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (icon != null && userState.isAuthorized)
                              {
                                IconButton(
                                  splashColor: transparent,
                                  highlightColor: transparent,
                                  icon: Icon(
                                    icon,
                                    color: grey,
                                  ),
                                  iconSize: rSHeight(25),
                                  onPressed: iconTap,
                                ),
                              }.toSet().first,
                            const HSpacer(
                              sizeFactor: SizeFactor.half,
                            ),
                            AnimatedContainer(
                              duration: _animationDuration,
                              child: Transform.rotate(
                                angle: angleOneState,
                                child: const PigArrow(turns: 1),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const VSpacer(sizeFactor: SizeFactor.half),
                    child1,
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              top: heightState,
              // bottom: 60,
              duration: _animationDuration,
              child: Container(
                width: _screenWidth,
                height: _screenHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: lightBorderRadius,
                  boxShadow: boxShadow(),
                ),
                child: PigPaddingContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VSpacer(sizeFactor: SizeFactor.half),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Heading2(title2, color: black),
                          Transform.rotate(
                            angle: angleTwoState,
                            child: const PigArrow(turns: 1),
                          ),
                        ],
                      ),
                      const VSpacer(sizeFactor: SizeFactor.half),
                      child2,
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
