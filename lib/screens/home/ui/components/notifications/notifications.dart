//* will be switched between authorized users and unauthorized
//~ This is where all the [Notifications] are shown and
//& Made by PIG

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/config.dart';

import '../../../../../data/dummie_notifications_data.dart';

import '../../../../../providers/user_state_provider.dart';

import '../../../../../widgets/global_utility_widgets.dart';

import '../../../providers/notifications_state_provider.dart';

import './notification_card.dart';

class Notifications extends ConsumerWidget {
  const Notifications({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //! This defines the [user] details like isManager or not do not remove or changed.
    final userState = watch(userStateProvider.state);

    final showNotificationState = watch(showNotificationStateProvider.state);
    final showPostNotificationState =
        watch(showPostNotificationStateProvider.state);
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: PigSheet(
        title: 'Notifications',
        icon: userState.isAuthorized ? Icons.list_rounded : null,
        iconTap: () {
          context
              .read(showAuthNotificationsStateProvider)
              .showAuthNotifications();
          //TODO show all the notifications that the authorized memeber has made.
          log("authorized members notifications list.");
        },
        height: rSHeight(250),
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            ///[notification] is a [list] which contains all the [notifications]
            children: notifications.map(
              (val) {
                return NotificationCard(
                  key: ObjectKey(val),
                  notification: val,
                  onTap: () {
                    /// if there is already a notification is being shown or [postnotification] is [open]
                    /// it won't show the [NotificationOverview]
                    if (!showNotificationState & !showPostNotificationState) {
                      ///this sets the showNotification to [true] so that it opens the [NotificationOverview]
                      context
                          .read(showNotificationStateProvider)
                          .showNotification();

                      ///this sends the values of the card clicked to the [NotificationOverview]
                      context
                          .read(notificationOverviewStateProvider)
                          .selectNotification(val);
                      // context.read(notificationOverviewAnimationStateProvider)
                    }
                  },
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
