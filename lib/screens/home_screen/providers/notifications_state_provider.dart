//~ This file provides all the state that is related to [Notifications]
//& Made by PIG
// ignore_for_file: use_setters_to_change_properties

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '/models/notification/notification.dart' as n;

//* global providers
///this provider gets the list of [notifications] that belongs to the [user]
class NotificationsNotifier extends StateNotifier<List<n.Notification>> {
  NotificationsNotifier() : super([]);
  void initNotifications() {
    //TODO: on app start init the notifications
  }
  void addToNotifications(n.Notification val) {
    //TODO: to get the notification from the server when there is new notification
    state.add(val);
    //TODO: in the background to add these to the app storage
  }
}

final notificationStateProvider =
    StateNotifierProvider<NotificationsNotifier>((ref) {
  return NotificationsNotifier();
});

///this tells if the [PostNotificationView] should be shown or not
class ShowPostNotificationNotifier extends StateNotifier<bool> {
  ShowPostNotificationNotifier() : super(false);

  void showPostNotification() {
    state = !state;
  }
}

final showPostNotificationStateProvider =
    StateNotifierProvider<ShowPostNotificationNotifier>((ref) {
  return ShowPostNotificationNotifier();
});

//^ Authorized Notification providers
//! DONOT MODIFY THESE!

/// this contains all the notifications made by the user
/// when inserted or a notification is made by the user
/// it will be uploaded to the app storage and also to the server
class AuthNotificationsNotifier extends StateNotifier<List<n.Notification>> {
  AuthNotificationsNotifier() : super([]);

  void initAuthNotifications(List<n.Notification> initialList) {
    /// [fromServer] if connection exists
    /// or [fromLocal]

    state = initialList;
  }

  void insToAuthNotifications(n.Notification notification) {
    state.add(notification);

    /// add [toServer] and [toLocal] functions.
  }

  void delFromAuthNotifications(n.Notification notification) {
    state.removeWhere((value) => value == notification);

    /// delete [fromServer] and [fromLocal] functions.
  }
}

final authNotificationsStateProvider =
    StateNotifierProvider<AuthNotificationsNotifier>((ref) {
  return AuthNotificationsNotifier();
});

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
  // log('validating title...', name: "post validation");

  // final String title = context.read(postTitleStateProvider).state;
  final String title =
      context.read(postTitleStateProvider).state.replaceAll(RegExp(r'\s'), "");

  if (title.isEmpty | (title == "")) {
    context.read(postTitleValidationStateProvider).state = false;
  } else {
    context.read(postTitleValidationStateProvider).state = true;
  }

  // if (context.read(postTitleValidationStateProvider).state) {
  //   log(
  //     "This is a valid post title",
  //     name: "post validation",
  //   );
  // } else {
  //   log(
  //     "",
  //     name: "post validation",
  //     error: "invaild post title",
  //   );
  // }
}

///it validates the [description] using regular expressions
void validatePostDescription(BuildContext context) {
  // log('validating Description...', name: "post validation");
  final String description = context
      .read(postDescriptionStateProvider)
      .state
      .replaceAll(RegExp(r"\s"), "");

  if (description.isEmpty | (description == "")) {
    context.read(postDescriptionValidationStateProvider).state = false;
  } else {
    context.read(postDescriptionValidationStateProvider).state = true;
  }
  // if (context.read(postDescriptionValidationStateProvider).state) {
  //   log("This is a valid post description", name: "post validation");
  // } else {
  //   log(
  //     "",
  //     name: "post validation",
  //     error: "invaild post description",
  //   );
  // }
}

///makes the validation states to default i.e, [true]
void defaultValidation(BuildContext context, {required bool values}) {
  context.read(postDescriptionValidationStateProvider).state = values;
  context.read(postTitleValidationStateProvider).state = values;
  // log("Making Providers to default", name: "post validation");
  // log("Making Editing Controllers to default", name: "post validation");
}
