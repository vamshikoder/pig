//~ Menu to the left which has Navigations to
//~ Chats Library About Settings
//& Made by PIG

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import '../../../../config/config.dart';

import '../../../../screens/about_screen/ui/about_screen.dart';
import '../../../../screens/chats_screen/ui/chats_screen.dart';
import '../../../../screens/library_screen/ui/library_screen.dart';
import '../../../../screens/settings_screen/ui/settings_screen.dart';

import '../../../../widgets/pig_drawer.dart';

class HomeMenu extends ConsumerWidget {
  final PigDrawerController controller;

  const HomeMenu({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    const Duration animationDuration = Duration(milliseconds: 250);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpacer(
            sizeFactor: SizeFactor.quater,
          ),
          GestureDetector(
            onTap: () {
              /// This closes the [PigDrawer]
              controller.close(context);
              Get.to(
                () => LibraryScreen(),
                duration: animationDuration,
                transition: Transition.rightToLeftWithFade,
              );
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
              /// This closes the [PigDrawer]
              controller.close(context);
              Get.to(
                () => ChatsScreen(),
                duration: animationDuration,
                transition: Transition.rightToLeftWithFade,
              );
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
              /// This closes the [PigDrawer]
              controller.close(context);
              Get.to(
                () => SettingsScreen(),
                duration: animationDuration,
                transition: Transition.rightToLeftWithFade,
              );
            },
            child: const Heading2(
              'Settings',
              color: primaryColor,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              /// This closes the [PigDrawer]
              controller.close(context);
              Get.to(
                () => AboutScreen(),
                duration: animationDuration,
                transition: Transition.rightToLeftWithFade,
              );
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
