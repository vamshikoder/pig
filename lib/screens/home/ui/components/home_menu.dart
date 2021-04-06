import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:pig/config/config.dart';
import 'package:pig/screens/about/ui/about.dart';
import 'package:pig/screens/chats/ui/chats.dart';
import 'package:pig/screens/library/ui/library.dart';
import 'package:pig/screens/settings/ui/settings.dart';

///implement your [Menu] below
///[recommended] it is good to move [HomeMenu] to different [file]
class HomeMenu extends ConsumerWidget {
  const HomeMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    /// remove [Scaffold] use [CustomScaffold] instead
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpacer(
            sizeFactor: SizeFactor.quater,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => Library(),
                  transition: Transition.leftToRightWithFade);
            },
            child: const Heading2(
              'Library',
              color: primaryColor,
            ),
          ),
          const VSpacer(
            sizeFactor: SizeFactor.quater,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => Chats(), transition: Transition.leftToRightWithFade);
            },
            child: const Heading2(
              'Chats',
              color: primaryColor,
            ),
          ),
          const VSpacer(
            sizeFactor: SizeFactor.quater,
          ),
          GestureDetector(
            onTap: () {
              Get.to(() => Settings(),
                  transition: Transition.leftToRightWithFade);
            },
            child: const Heading2(
              'Settings',
              color: primaryColor,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.to(() => About(), transition: Transition.leftToRightWithFade);
            },
            child: const Heading2(
              'About Us',
              color: primaryColor,
            ),
          ),
        ],
      ), // write your menu code here
    );
  }
}
