import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:pig/config/config.dart';
// import 'package:pig/screens/home/ui/home.dart';

import 'global_utility_widgets.dart';

class PigSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final String? hintText;
  const PigSearchBar({
    Key? key,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.hintText,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PContainer(
          sizeFactor: SizeFactor.half,
          child: Container(
            height: rSHeight(50),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: lightBoxShadow,
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
                  suffixIcon: const PContainer(
                    sizeFactor: SizeFactor.half,
                    child: Icon(
                      Icons.search,
                      color: primaryColor,
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
    );
  }
}
