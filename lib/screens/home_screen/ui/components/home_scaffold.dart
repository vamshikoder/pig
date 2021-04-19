//* will be switched between authorized users and unauthorized
//~ this the [Home] screen contains [Notification],[Calendar], [TimeTable],
//~ it also contains [AppBar] with [Account],[Chats] Navigation
//~ and also has a [PostNotification] button for authorized users
//& Made by PIG

import 'dart:ui';

// import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import '../../../../config/config.dart';

// import '../../../../providers/user_state_provider.dart';

import '../../../../screens/account_screen/ui/account_screen.dart';
import '../../../../screens/chats_screen/ui/chats_screen.dart';

import '../../../../widgets/global_utility_widgets.dart';
import '../../../../widgets/pig_drawer.dart';
import '../../../../widgets/pig_stacked_sheet.dart';

import '../../providers/notifications_state_provider.dart';

import './notifications/auth_notifications_view.dart';
import './notifications/notification_overview_view.dart';
import './notifications/notifications.dart';
import './notifications/post_notification/post_notification_view.dart';

import './pig_calendar.dart';
import './pig_timetable.dart';

class HomeScaffold extends ConsumerWidget {
  final PigDrawerController controller;

  const HomeScaffold({
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    ///[showNotificationState] if there is any [NotificationOverview] is displayed or not.
    ///according to that it manages to show or do not show the [NotificatoinOverview] or not
    final showNotificationState = watch(showNotificationStateProvider.state);

    //! This defines the [user] details like isManager or not do not remove or changed.
    // final userState = watch(userStateProvider.state);

    ///[showPostNotificationState] if there is [PostNotificationview] is displayed or not.
    ///according to that it manages to show or do not show the [PostNotificationview] or not
    final showPostNotificationState =
        watch(showPostNotificationStateProvider.state);

    /// according to [showNotificationState] it manages to show or do not show the [NotificatoinOverview] or not
    final notificationOverviewState =
        watch(notificationOverviewStateProvider.state);

    /// according to [showAuthNotificationListState] it manages to show or do not show the [AuthNotificationList] or not
    final showAuthNotificationsState =
        watch(showAuthNotificationsStateProvider.state);

    final scaffoldBlockState = watch(scaffoldBlockStateProvider.state);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        PigCustomScaffold(
          title: 'home',
          head: [
            IconButton(
              splashColor: transparent,
              highlightColor: transparent,
              icon: const Icon(
                Icons.chat_outlined,
                color: primaryColor,
              ),
              onPressed: () {
                Get.to(
                  /// it pushes to [Chats] page.
                  () => ChatsScreen(),
                  transition: Transition.leftToRightWithFade,
                );
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
                      () => AccountScreen(),
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
                  child: PigStackedSheets(
                    title1: 'calendar',
                    title2: 'timetable',

                    ///[PigCalendar] shows a custom Calendar
                    child1: const PigCalendar(),
                    child2: const PigTimeTable(),
                    heightFactor: 0.55,
                    icon: Icons.event_rounded,
                    iconTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),

        ///[if] any [NotificationCard] is tapped then it opens the [NotificationOverView]
        ///[else] it shows an empty [Container]

        if (showNotificationState)
          NotificationOverviewView(
            notification: notificationOverviewState,
          )
        else
          Container(),

        ///[if] [addPostNofitication] is tapped then it opens the [PostNotificationView]
        ///[else] it shows an empty [Container]
        if (showPostNotificationState)
          const PostNotificationView()
        else
          Container(),
        if (showAuthNotificationsState)
          const AuthNotificationsView()
        else
          Container(),
        if (scaffoldBlockState)
          Empty(
            controller: controller,
          )
        else
          Container(),
      ],
    );
  }
}

class Empty extends StatelessWidget {
  final PigDrawerController controller;

  const Empty({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        controller.close(context);
      },
      child: Scaffold(
        backgroundColor: transparent,
        body: ClipRRect(
          borderRadius: lightBorderRadius,
          child: Container(
            color: black.withOpacity(0.01),
            height: screenHeight,
            width: screenWidth,
            child: BackdropFilter(
              ///this blurs the [background] for a focused feeling
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
