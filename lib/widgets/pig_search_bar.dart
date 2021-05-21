//~ This is custom search bar made for PIG conatins all
//~ the boiler plate code written
//& Made by PIG

import 'package:flutter/material.dart';
import 'package:pig/config/config.dart';
import 'package:get/route_manager.dart';

import './global_utility_widgets.dart';

class PigSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final DisplayIcon? displayIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final String? hintText;
  final SizeFactor? sizeFactor;
  const PigSearchBar({
    Key? key,
    required this.controller,
    this.onChanged,
    this.onSubmitted,
    this.hintText,
    this.sizeFactor,
    this.displayIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SizeFactor _sizeFactor = sizeFactor ?? SizeFactor.half;
    return LimitedBox(
      maxHeight: Get.height * 0.1,
      child: Column(
        children: [
          PigPaddingContainer(
            sizeFactor: _sizeFactor,
            child: Container(
              height: rSHeight(50),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: lightBoxShadow(),
                borderRadius: deepBorderRadius,
              ),
              child: Center(
                child: TextField(
                  cursorColor: primaryColor,
                  controller: controller,
                  onChanged: onChanged,
                  onSubmitted: onSubmitted,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: grey.withOpacity(0.5),
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.0,
                    ),
                    suffixIcon: controller.text == ""
                        ? PigPaddingContainer(
                            sizeFactor: SizeFactor.half,
                            child: Icon(
                              getDisplayIcon(displayIcon!),
                              color: primaryColor,
                            ),
                          )
                        : PigPaddingContainer(
                            sizeFactor: SizeFactor.half,
                            child: GestureDetector(
                              ///this is [onPressed] which calls a fucntion that clears the contents from [TextFeild]
                              ///and also the [providers]
                              onTap: () {
                                controller.text = "";
                              },
                              child: const Icon(
                                Icons.close_rounded,
                                size: 20.0,
                                color: errorColor,
                              ),
                            ),
                          ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const VSpacer(
            sizeFactor: SizeFactor.half,
          ),
        ],
      ),
    );
  }

  IconData? getDisplayIcon(DisplayIcon displayIcon) {
    IconData icon;
    switch (displayIcon) {
      case DisplayIcon.search:
        icon = Icons.search;
        break;
      case DisplayIcon.email:
        icon = Icons.email_outlined;
        break;
      case DisplayIcon.password:
        icon = Icons.lock_outline_rounded;
        break;
    }
    return icon;
  }
}

enum DisplayIcon { search, email, password }
