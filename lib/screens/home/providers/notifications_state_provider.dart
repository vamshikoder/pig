//~ This file provides all the state that is related to [Notifications]
//& Made by PIG

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pig/models/notification_model.dart' as n;

//* global providers
///this provider gets the list of [notifications] that belongs to the [user]
class NotificationsNotifier extends StateNotifier<List<n.Notification>> {
  NotificationsNotifier() : super([]);
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

  // ignore: use_setters_to_change_properties
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

//^ Authorized providers
//! DONOT MODIFY THESE!
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
