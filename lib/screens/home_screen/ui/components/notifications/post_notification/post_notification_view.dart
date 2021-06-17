//^ Available only to authorized users
//~ This file is used to  create a overlay over the [HomeScaffold]
//~ which shows the PostNotificationView which allows users to post notifications
//& Made by PIG

import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './post_description_textfeild.dart';
import './post_title_textfeild.dart';

import '/config/config.dart';

import '/models/notification/notification.dart' as n;

import '/providers/user_state_provider.dart';

import '/screens/home_screen/providers/notifications_state_provider.dart';

import '/widgets/global_utility_widgets.dart';

class PostNotificationView extends ConsumerWidget {
  // final n.Notification notification;

  const PostNotificationView({
    Key? key,
    // required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // final showNotificationScopeState =
    //     watch(showNotificationScopeStateProvider.state);

    // final scopeState = watch(scopeStateProvider.state);
    final postTitleState = watch(postTitleStateProvider).state;
    final postDescriptionState = watch(postDescriptionStateProvider).state;
    // final authNotificationsState = watch(authNotificationsStateProvider.state);
    final userState = watch(userStateProvider.state);
    return PigKeyboardDismissiableWrapper(
      child: GestureDetector(
        onTap: () {
          ///This checks for the [title] and [description] [if] both of them are [not null]
          ///then it allows to [close] the [PostNotificationView]
          if (postTitleState.isNotEmpty | postDescriptionState.isNotEmpty) {
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
        child: Container(
          color: black.withOpacity(0.3),
          height: screenHeight,
          width: double.infinity,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5,
              sigmaY: 5,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Center(
                child: PigPaddingContainer(
                  child: Container(
                    height: screenHeight * 0.7,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: deepBorderRadius,
                      boxShadow: boxShadow(),
                    ),
                    child: PigPaddingContainer(
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
                          GestureDetector(
                            onTap: () {
                              if (postTitleState.isEmpty |
                                  postDescriptionState.isEmpty) {
                                // buildShowDialog(context);
                                if (postTitleState.isEmpty) {
                                  context
                                      .read(postTitleValidationStateProvider)
                                      .state = false;
                                }
                                if (postDescriptionState.isEmpty) {
                                  context
                                      .read(
                                          postDescriptionValidationStateProvider)
                                      .state = false;
                                }

                                // TODO need to post message that tilte and description are required.
                              } else {
                                context
                                    .read(authNotificationsStateProvider)
                                    .insToAuthNotifications(
                                      n.Notification(
                                        author: userState.name,
                                        title: postTitleState,
                                        description: postDescriptionState,
                                        time: DateTime.now(),
                                      ),
                                    );
                                context
                                    .read(showPostNotificationStateProvider)
                                    .showPostNotification();
                                defaultValidation(context, values: true);
                                clearTitle(context);
                                postTitleController.text = "";
                                clearDescription(context);
                                postDescriptionController.text = "";
                                // buildPigScopeDialog(context);
                              }
                            },
                            child: const PigPaddingContainer(
                              verticalPadding: true,
                              child: SubText(
                                "Next",
                                bold: true,
                              ),
                            ),
                          ),
                          // const PostActions()
                        ],
                      ),
                    ),
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
    final postDescriptionState = watch(postDescriptionStateProvider).state;
    return IconButton(
      icon: const Icon(
        Icons.close_rounded,
        color: errorColor,
      ),
      onPressed: () {
        ///This checks for the [title] and [description] [if] both of them are [not null]
        ///then it allows to [close] the [PostNotificationView]
        if (postTitleState.isNotEmpty | postDescriptionState.isNotEmpty) {
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
        if (postTitleValidationState &
            postDescriptionValidationState &
            postTitleState.isNotEmpty &
            postDescriptionState.isNotEmpty) {
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
        }
      },
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(
          boxShadow: lightBoxShadow(),
          color: primaryColor,
          borderRadius: lightBorderRadius,
        ),
        child: const PigPaddingContainer(
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
