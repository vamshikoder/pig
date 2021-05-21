//* will be switched between authorized users and unauthorized
//~ this the [Home] screen contains [Notification],[Calendar], [TimeTable],
//~ it also contains [AppBar] with [Account],[Chats] Navigation
//~ and also has a [PostNotification] button for authorized users
//& Made by PIG

import 'dart:ui';

// import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:get/route_manager.dart';

import '../../../../config/config.dart';

// import '../../../../providers/user_state_provider.dart';

// import '../../../../screens/account_screen/ui/account_screen.dart';
// import '../../../../screens/chats_screen/ui/chats_screen.dart';

// import '../../../../widgets/global_utility_widgets.dart';
import '../../../../widgets/pig_drawer.dart';
// import '../../../../widgets/pig_stacked_sheet.dart';

import '../../providers/notifications_state_provider.dart';

// import './notifications/notification_overview_view.dart';
import './notifications/notifications.dart';
import './notifications/post_notification/post_notification_view.dart';

import 'calendars/upcomming_events.dart';
// import './pig_timetable.dart';

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
    // final showNotificationState = watch(showNotificationStateProvider.state);

    //! This defines the [user] details like isManager or not do not remove or changed.
    // final userState = watch(userStateProvider.state);

    ///[showPostNotificationState] if there is [PostNotificationview] is displayed or not.
    ///according to that it manages to show or do not show the [PostNotificationview] or not
    final showPostNotificationState =
        watch(showPostNotificationStateProvider.state);

    /// according to [showNotificationState] it manages to show or do not show the [NotificatoinOverview] or not
    // final notificationOverviewState =
    //     watch(notificationOverviewStateProvider.state);

    /// according to [showAuthNotificationListState] it manages to show or do not show the [AuthNotificationList] or not

    final scaffoldBlockState = watch(scaffoldBlockStateProvider.state);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Scaffold(
          backgroundColor: white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                ///[Notification] list view
                Notifications(),
                UpcommingEvents(),
              ],
            ),
          ),
        ),
        if (showPostNotificationState)
          const PostNotificationView()
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
