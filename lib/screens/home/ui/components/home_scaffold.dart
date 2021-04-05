import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import '../../../../config/config.dart';

import '../../../../screens/account/ui/account.dart';
import '../../../../screens/chats/ui/chats.dart';

import '../../../../widgets/global_utility_widgets.dart';
import '../../../../widgets/stacked_sheet.dart';

import '../../providers/notifications_state_provider.dart';
import './notifications/notification_overview.dart';
import './notifications/notifications.dart';
import './notifications/post_notification/post_notification_view.dart';

import './pig_calendar.dart';

class HomeScaffold extends ConsumerWidget {
  const HomeScaffold({
    Key? key,
  }) : super(key: key);

  ///this the [Home] screen contains [Notification],[Calendar], [TimeTable],
  ///it also contains [AppBar] with [Account],[Chats] Navigation
  ///and also has a [PostNotification] button
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    ///[showNotificationState] if there is any [NotificationOverview] is displayed or not.
    ///according to that it manages to show or do not show the [NotificatoinOverview] or not
    final showNotificationState = watch(showNotificationStateProvider.state);

    ///[showPostNotificationState] if there is [PostNotificationview] is displayed or not.
    ///according to that it manages to show or do not show the [PostNotificationview] or not
    final showPostNotificationState =
        watch(showPostNotificationStateProvider.state);

    /// according to [showNotificationState] it manages to show or do not show the [NotificatoinOverview] or not
    final notificationOverviewState =
        watch(notificationOverviewStateProvider.state);
    return Stack(
      children: [
        CustomScaffold(
          title: 'home',
          head: [
            IconButton(
              splashColor: transparent,
              highlightColor: transparent,
              icon: const Icon(
                Icons.chat_outlined,
                color: grey,
              ),
              onPressed: () {
                /// when [NotificationOverview] or [PostNotification] is not shown then
                if (!showNotificationState & !showPostNotificationState) {
                  Get.to(
                    /// it pushes to [Chats] page.
                    () => Chats(),
                    transition: Transition.leftToRightWithFade,
                  );
                }
              },
            ),

            ///only if user is [manager] show this [add] icons and be able to add [post/notifications]
            IconButton(
              splashColor: transparent,
              highlightColor: transparent,
              icon: const Icon(
                Icons.add_box_outlined,
                color: grey,
              ),
              onPressed: () {
                /// when [NotificationOverview] or [PostNotification] is not shown then
                if (!showNotificationState & !showPostNotificationState) {
                  /// it allows the [user] to open a [PostNotification]
                  context
                      .read(showPostNotificationStateProvider)
                      .showPostNotification();
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                right: hPadding(0.5),
              ),
              child: GestureDetector(
                onTap: () {
                  /// when [NotificationOverview] or [PostNotification] is not shown then
                  if (!showNotificationState & !showPostNotificationState) {
                    /// it pushes to [Accounts] page.
                    Get.to(
                      () => Account(),
                      transition: Transition.leftToRightWithFade,
                    );
                  }
                },

                ///[users] profile photo will be shown here
                child: const CircleAvatar(
                  backgroundColor: primaryColor,
                ),
              ),
            )
          ],
          body: Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ///[Notification] list view
                const Positioned(
                  top: 5.0,
                  child: Notifications(),
                ),
                Positioned(
                  top: rSHeight(210),

                  ///[StackedSheets] with calendar and timetable
                  child: const StackedSheets(
                    title1: 'calendar',
                    title2: 'timetable',

                    ///[PigCalendar] shows a custom Calendar
                    child1: PigCalendar(),
                    child2: SubText('hello from title2'),
                    heightFactor: 0.55,
                  ),
                ),
              ],
            ),
          ),
        ),

        ///[if] any [NotificationCard] is tapped then it opens the [NotificationOverView]
        ///[else] it shows an empty [Container]
        if (showNotificationState)
          NotificationOverview(
            notification: notificationOverviewState,
          )
        else
          Container(),

        ///[if] [addPostNofitication] is tapped then it opens the [PostNotificationView]
        ///[else] it shows an empty [Container]
        if (showPostNotificationState)
          const PostNotificationView()
        else
          Container()
      ],
    );
  }
}
