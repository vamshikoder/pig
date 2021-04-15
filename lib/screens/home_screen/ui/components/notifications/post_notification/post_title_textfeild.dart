//^ Available only to authorized users
//~ this is a [TextFeild] which allows the [user] to give the [notification] a [title]
//& Made by PIG

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../config/config.dart';

import './post_notification_view.dart';

class PostTitleTextFeild extends ConsumerWidget {
  final TextEditingController controller;

  const PostTitleTextFeild({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    /// this [provider] is used to check if the [title] provided is a vaild one or not

    final postTitleValidationState =
        watch(postTitleValidationStateProvider).state;

    return TextField(
      key: const Key('title'),
      keyboardType: TextInputType.text,
      controller: controller,
      textInputAction: TextInputAction.done,
      maxLength: 30,
      cursorColor: primaryColor,
      onChanged: (value) {
        addToTitle(context, value);
      },
      onEditingComplete: () {
        validatePostTitle(context);

        ///closes [keyboard] after clicking the [done] button on [keyboard]
        final FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      decoration: InputDecoration(
        ///when the [description] is invaild an [errorText] is shown
        errorText: postTitleValidationState ? null : "Title Required",

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
                  clearTitle(context);
                },
              ),
        labelText: 'title',
        labelStyle: TextStyle(
          color: grey.withOpacity(0.5),
          fontFamily: 'Poppins',
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0,
        ),
        hintText: '"hackthon 2021"',
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
        focusedErrorBorder: postTitleValidationState
            ? null
            : const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor),
              ),

        ///when the [TextFeild] is clicked then the [border] color changes to [primaryColor]
        focusedBorder: postTitleValidationState
            ? const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor))
            : null,
        errorBorder: postTitleValidationState
            ? null
            : const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor),
              ),
      ),
    );
  }
}
