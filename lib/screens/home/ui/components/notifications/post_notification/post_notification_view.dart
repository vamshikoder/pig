import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../config/config.dart';

import '../../../../../../widgets/global_utility_widgets.dart';

import '../../../../providers/notifications_state_provider.dart';

import './post_description_text_feild.dart';
import './post_title_text_feild.dart';

///this contains the [title]
final postTitleStateProvider = StateProvider<String>((ref) {
  return "";
});

///this contains the [description]
final postDescriptionStateProvider = StateProvider<String>((ref) {
  return "";
});

///This [provider] is set to [true] if the [tile] posted is a vaild one
final postTitleValidationStateProvider = StateProvider<bool>((ref) {
  return true;
});

///This [provider] is set to [true] if the [description] posted is a vaild one
final postDescriptionValidationStateProvider = StateProvider<bool>((ref) {
  return true;
});

///[TextEditingController] for the [title] used to manipulate the [TextFeild]
final TextEditingController postTitleController = TextEditingController();

///[TextEditingController] for the [description] used to manipulate the [TextFeild]
final TextEditingController postDescriptionController = TextEditingController();

class PostNotificationView extends ConsumerWidget {
  // final n.Notification notification;

  const PostNotificationView({
    Key? key,
    // required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final Size _size = MediaQuery.of(context).size;
    final double _sHeight = _size.height;

    return KeyboardDismissiableWrapper(
      child: Container(
        color: transparent,
        height: _sHeight,
        width: double.infinity,
        child: BackdropFilter(
          ///this blurs the [background] for a focused feeling
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Center(
            child: PContainer(
              child: Container(
                height: _sHeight * 0.6,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: white,
                  borderRadius: deepBorderRadius,
                  boxShadow: boxShadow,
                ),
                child: PContainer(
                  verticalPadding: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Heading2(
                            'post notification',
                            color: black,
                          ),

                          ///[close] icon which closes the [PostNotificationView]
                          PostNotificationViewCloseButton(),
                        ],
                      ),
                      Expanded(
                        flex: 0,
                        child: Center(
                          ///[TextFeild] which takes the [title]
                          child: PostTitleTextFeild(
                            controller: postTitleController,
                          ),
                        ),
                      ),
                      const VSpacer(
                        sizeFactor: SizeFactor.quater,
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          ///[TextFeild] which takes the [description]
                          child: PostDescriptionTextFeild(
                            controller: postDescriptionController,
                          ),
                        ),
                      ),
                      const VSpacer(
                        sizeFactor: SizeFactor.quater,
                      ),
                      const PostActions()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PostNotificationViewCloseButton extends ConsumerWidget {
  ///[close] icon which closes the [PostNotificationView]

  const PostNotificationViewCloseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final postTitleState = watch(postTitleStateProvider).state;
    final postDescriptionState = watch(postTitleStateProvider).state;
    return IconButton(
      icon: const Icon(
        Icons.close_rounded,
        color: errorColor,
      ),
      onPressed: () {
        ///This checks for the [title] and [description] [if] both of them are [not null]
        ///then it allows to [close] the [PostNotificationView]
        if (postTitleState.isNotEmpty & postDescriptionState.isNotEmpty) {
          buildShowDialog(context);
        }

        ///or [else] it shows a [dialog] which asks if the user wants to [close] [PostNotificationView]
        else {
          context
              .read(showPostNotificationStateProvider)
              .showPostNotification();

          ///if the user chose to [close] then the defaultValues are set to the [providers]
          defaultValidation(context, values: true);
          clearTitle(context);
          postTitleController.text = "";
          clearDescription(context);
          postDescriptionController.text = "";
        }
      },
    );
  }
}

class PostActions extends ConsumerWidget {
  /// [post] button
  const PostActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    ///validation states which are checked if [true] i.e, correct or not.
    final postTitleValidationState =
        watch(postTitleValidationStateProvider).state;
    final postDescriptionValidationState =
        watch(postDescriptionValidationStateProvider).state;

    ///this takes the [title] and [description] values
    final postTitleState = watch(postTitleStateProvider).state;
    final postDescriptionState = watch(postDescriptionStateProvider).state;

    Color getColor(Set<MaterialState> states) {
      ///setting the button [theme] when
      ///[pressed]
      ///[hoverd]
      ///[focused]
      ///to [transparent]
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return transparent;
      }
      return transparent;
    }

    return TextButton(
      ///button which allow to [post]
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith(getColor),
      ),
      onPressed: () {
        ///validates the [title] and [description] one more time.
        validatePostTitle(context);
        validatePostDescription(context);

        /// if the [title] and [description] are vaild then the [notification] is posted
        if (postTitleValidationState & postDescriptionValidationState) {
          log(postTitleState, name: "posted Title");
          log(postDescriptionState, name: "posted descr");
          //TODO function to post the notification to the database

          /// after posting the notification to the database it clears the [providers] and
          ///[TextEditingControllers]
          context
              .read(showPostNotificationStateProvider)
              .showPostNotification();
          defaultValidation(context, values: true);
          clearTitle(context);
          postTitleController.text = "";
          clearDescription(context);
          postDescriptionController.text = "";

          ///shows a message if the post was sent sucessfully or not
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: primaryColor,
              content: Text('posted your notification'),
            ),
          );
        } else {
          //TODO when the value is empty need to show error
          if (!postTitleValidationState) {}
          if (!postDescriptionValidationState) {}
          if (!postTitleValidationState & !postDescriptionValidationState) {}
        }
      },
      child: Container(
        height: 40.0,
        decoration: const BoxDecoration(
          boxShadow: lightBoxShadow,
          color: primaryColor,
          borderRadius: lightBorderRadius,
        ),
        child: const PContainer(
          verticalPadding: true,
          sizeFactor: SizeFactor.quater,
          child: SubText(
            'Post',
            color: white,
            bold: true,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

///as the [text] in the [Title TextFeild] changes it updates the [title provider]
void addToTitle(BuildContext context, String value) {
  context.read(postTitleStateProvider).state = value;
  validatePostTitle(context);
}

///as the [text] in the [Description TextFeild] changes it updates the [description provider]
void addToDescription(BuildContext context, String value) {
  context.read(postDescriptionStateProvider).state = value;
  validatePostDescription(context);
}

/// it clears the [title provider]
void clearTitle(BuildContext context) {
  context.read(postTitleStateProvider).state = "";
}

/// it clears the [description provider]
void clearDescription(BuildContext context) {
  context.read(postDescriptionStateProvider).state = "";
}

///it validates the [title] using regular expressions
void validatePostTitle(BuildContext context) {
  final String title = context.read(postTitleStateProvider).state;
  // .replaceAll(RegExp(r"\s\b|\b\s"), "");

  title.isEmpty
      ? context.read(postTitleValidationStateProvider).state = false
      : context.read(postTitleValidationStateProvider).state = true;
  log(context.read(postTitleValidationStateProvider).state.toString(),
      name: "title valid");
}

///it validates the [description] using regular expressions
void validatePostDescription(BuildContext context) {
  final String description = context
      .read(postDescriptionStateProvider)
      .state
      .replaceAll(RegExp(r"\s\b|\b\s"), "");

  description.isEmpty
      ? context.read(postDescriptionValidationStateProvider).state = false
      : context.read(postDescriptionValidationStateProvider).state = true;
  log(context.read(postDescriptionValidationStateProvider).state.toString(),
      name: "descr valid");
}

///makes the validation states to default i.e, [true]
void defaultValidation(BuildContext context, {required bool values}) {
  context.read(postDescriptionValidationStateProvider).state = values;
  context.read(postTitleValidationStateProvider).state = values;
}

///this shows an [AlertDialog] asks if the user wants to discard the post or not
Future buildShowDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 8.0,
        shape: const RoundedRectangleBorder(borderRadius: lightBorderRadius),
        backgroundColor: white,
        title: const SubText(
          'Discard Post?',
          color: black,
          bold: true,
        ),
        content: const SubText(
          'Post Will Be Lost, Are You Sure?',
          color: grey,
        ),
        actions: [
          TextButton(
            onPressed: () {
              ///if the user chose to [close] then the defaultValues are set to the [providers]

              Navigator.of(context).pop();
            },
            child: const SubTitle(
              'No',
              bold: true,
            ),
          ),
          TextButton(
            onPressed: () {
              ///it clears the [providers] and [TextEditingControllers]
              ///when [user] chose to [discard] the [notification]
              defaultValidation(context, values: true);
              clearTitle(context);
              postTitleController.text = "";
              clearDescription(context);
              postDescriptionController.text = "";
              Navigator.of(context).pop();
              context
                  .read(showPostNotificationStateProvider)
                  .showPostNotification();
            },
            child: const SubTitle(
              'Yes',
              color: errorColor,
              bold: true,
            ),
          )
        ],
      );
    },
  );
}
