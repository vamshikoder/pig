import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../config/config.dart';

import './post_notification_view.dart';

class PostDescriptionTextFeild extends ConsumerWidget {
  ///this is a [TextFeild] which allows the [user] to give the [notification] a [description]
  final TextEditingController controller;

  const PostDescriptionTextFeild({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    /// this [provider] is used to check if the [description] provided is a vaild one or not
    final postDescriptionValidationState =
        watch(postDescriptionValidationStateProvider).state;
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.done,
      maxLines: 8,
      maxLength: 600,
      onChanged: (value) {
        addToDescription(context, value);
      },
      cursorColor: primaryColor,
      decoration: InputDecoration(
        ///when the [description] is invaild an [errorText] is shown
        errorText:
            postDescriptionValidationState ? null : "Description Required",

        ///when the [text] is not empty then an [close] icon is shown
        ///which allows the user to clear the [text] in the [TextFeild]
        suffixIcon: controller.text.isEmpty
            ? Container(
                width: 0.0,
              )
            : IconButton(
                icon: const Icon(
                  Icons.close_rounded,
                  size: 20.0,
                  color: errorColor,
                ),

                ///this is [onPressed] which calls a fucntion that clears the contents from [TextFeild]
                ///and also the [providers]
                onPressed: () {
                  controller.clear();
                  clearDescription(context);
                },
              ),
        labelText: 'description',
        labelStyle: TextStyle(
          color: grey.withOpacity(0.5),
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0,
        ),
        hintText: '"participate in the hackthon"',
        hintStyle: TextStyle(
          color: grey.withOpacity(0.5),
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: grey),
        ),

        ///when the [TextFeild] is clicked and has an [error] then [border] color changes to [errorColor]
        focusedErrorBorder: postDescriptionValidationState
            ? null
            : const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor),
              ),

        ///when the [TextFeild] is clicked then the [border] color changes to [primaryColor]
        focusedBorder: postDescriptionValidationState
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor))
            : null,

        ///if the text provided is [invaild] then the [borderColor] changes to [errorColor]
        errorBorder: postDescriptionValidationState
            ? null
            : const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor),
              ),
      ),
    );
  }
}
