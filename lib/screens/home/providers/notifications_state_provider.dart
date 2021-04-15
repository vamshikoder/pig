//~ This file provides all the state that is related to [Notifications]
//& Made by PIG
// ignore_for_file: use_setters_to_change_properties
//
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pig/models/notification/notification.dart' as n;

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

///this tells if the [NotificationOverview] should be shown or not
class ShowNotificationNotifier extends StateNotifier<bool> {
  ShowNotificationNotifier() : super(false);

  void showNotification() {
    state = !state;
  }
}

final showNotificationStateProvider =
    StateNotifierProvider<ShowNotificationNotifier>((ref) {
  return ShowNotificationNotifier();
});

///this store the details of the seleted [notification]
class NotificationOverviewNotifier extends StateNotifier<n.Notification> {
  NotificationOverviewNotifier()
      : super(n.Notification(
          title: "",
          time: DateTime.now(),
          author: "",
          description: "",
        ));

  void selectNotification(n.Notification notification) {
    state = notification;
  }
}

final notificationOverviewStateProvider =
    StateNotifierProvider<NotificationOverviewNotifier>((ref) {
  return NotificationOverviewNotifier();
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

class AuthNotificationsNotifier extends StateNotifier<List<n.Notification>> {
  AuthNotificationsNotifier() : super([]);

  void initAuthNotifications(List<n.Notification> initialList) {
    // TODO: any other editing on init
    state = initialList;
  }

  void addToAuthNotifications(n.Notification val) {
    state.add(val);
    //TODO: in the background to add these to the app storage
    //TODO: also add this to the server
  }

  void subFromAuthNotifications(n.Notification val) =>
      state.removeWhere((value) => value == val);
}

final authNotificationsStateProvider =
    StateNotifierProvider<AuthNotificationsNotifier>((ref) {
  return AuthNotificationsNotifier();
});

class ShowAuthNotificationsNotifier extends StateNotifier<bool> {
  ShowAuthNotificationsNotifier() : super(false);
  void showAuthNotifications() {
    state = !state;
  }
}

final showAuthNotificationsStateProvider =
    StateNotifierProvider<ShowAuthNotificationsNotifier>((ref) {
  return ShowAuthNotificationsNotifier();
});
