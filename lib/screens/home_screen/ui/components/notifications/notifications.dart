//* will be switched between authorized users and unauthorized
//~ This is where all the [Notifications] are shown and
//& Made by PIG

import 'dart:developer';

import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:pig/screens/home_screen/ui/components/notifications/auth_notifications_view.dart';

import '../../../../../config/config.dart';

import '../../../../../data/dummie_notifications_data.dart';

import '../../../../../providers/user_state_provider.dart';

import '../../../../../widgets/global_utility_widgets.dart';

import '../../../providers/notifications_state_provider.dart';

import './notification_card.dart';
import './notification_overview_view.dart';

class Notifications extends ConsumerWidget {
  const Notifications({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    //! This defines the [user] details like isManager or not do not remove or changed.
    final userState = watch(userStateProvider.state);

    // final showNotificationState = watch(showNotificationStateProvider.state);
    // final showPostNotificationState =
    //     watch(showPostNotificationStateProvider.state);
    // final notificationOverviewState =
    //     watch(notificationOverviewStateProvider.state);

    return PigSheet(
      title: 'Notifications',
      icons: userState.isAuthorized
          ? [
              IconButton(
                tooltip: "post notification.",
                splashColor: transparent,
                highlightColor: transparent,
                icon: DecoratedIcon(
                  Icons.add,
                  color: primaryColor,
                  size: 25,
                  shadows: [
                    BoxShadow(
                      blurRadius: 15.0,
                      color: primaryColor.withOpacity(0.8),
                      offset: const Offset(3.0, 3.0),
                    ),
                  ],
                ),
                onPressed: () {
                  /// it allows the [Authorized] to open a [PostNotification]
                  context
                      .read(showPostNotificationStateProvider)
                      .showPostNotification();
                  // }
                },
              ),
              IconButton(
                  tooltip: "Notifications you posted",
                  splashColor: transparent,
                  highlightColor: transparent,
                  icon: DecoratedIcon(
                    Icons.list_rounded,
                    color: primaryColor,
                    size: 25,
                    shadows: [
                      BoxShadow(
                        blurRadius: 15.0,
                        color: primaryColor.withOpacity(0.8),
                        offset: const Offset(3.0, 3.0),
                      ),
                    ],
                  ),
                  onPressed: () {
                    Get.to(
                      () => const AuthNotificationsView(),
                      transition: Transition.downToUp,
                    );

                    //TODO show all the notifications that the authorized memeber has made.
                    log("authorized members notifications list.");
                  }),
            ]
          : null,
      height: screenHeight * 0.26,
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          ///[notification] is a [list] which contains all the [notifications]
          children: notifications.map(
            (notification) {
              final Color _color = primaryColor.withOpacity(0.3);
              return NotificationCard(
                color: _color,
                key: ObjectKey(notification),
                notification: notification,
                onTap: () {
                  /// if there is already a notification is being shown or [postnotification] is [open]
                  /// it won't show the [NotificationOverview]
                  // if (!showNotificationState & !showPostNotificationState) {
                  ///this sets the showNotification to [true] so that it opens the [NotificationOverview]
                  context
                      .read(notificationOverviewStateProvider)
                      .selectNotification(notification);
                  log(notification.title);
                  // context
                  //     .read(showNotificationStateProvider)
                  //     .showNotification();
                  Get.to(
                    () => NotificationOverviewView(
                      color: _color,
                      notification: notification,
                    ),
                  );

                  ///this sends the values of the card clicked to the [NotificationOverview]
                  // context.read(notificationOverviewAnimationStateProvider)
                  // }
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
