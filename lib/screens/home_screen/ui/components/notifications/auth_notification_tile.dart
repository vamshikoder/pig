//^ Available only to authorized users
//~ This is single tile with expand on tap which reveals the description
//~ and on left to right swipe will delete the notification
//~ right to left will enable us to edit the notification ^future updates
//~ which shows Notifications made by the user.
//& Made by PIG

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/config.dart';

import '../../../../../models/notification/notification.dart' as n;

import '../../../../../utils/date_time.dart';

import '../../../../../widgets/pig_expansion_tile.dart';

import '../../../providers/notifications_state_provider.dart';

class AuthNotificationTile extends StatelessWidget {
  final n.Notification notification;
  final Color color;
  const AuthNotificationTile({
    Key? key,
    required this.notification,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        // boxShadow: lightBoxShadow(),
        borderRadius: lightBorderRadius,
      ),
      child: ClipRRect(
        borderRadius: lightBorderRadius,
        child: Dismissible(
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) {
            //ignore:missing_enum_constant_in_switch
            switch (direction) {
              //* in the future may be add a edit option to the notification
              // case DismissDirection.endToStart:
              //   log("Edit the notification");
              //   break;
              case DismissDirection.startToEnd:
                context
                    .read(authNotificationsStateProvider)
                    .delFromAuthNotifications(notification);
                log("deleted the notification");
                break;
            }
          },
          //* in the future may be add a edit option to the notification
          // secondaryBackground: Container(
          //   color: primaryColor,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: const [
          //       Icon(
          //         Icons.edit_rounded,
          //         color: white,
          //       ),
          //       HSpacer(
          //         sizeFactor: SizeFactor.quater,
          //       ),
          //     ],
          //   ),
          // ),
          background: Container(
            color: errorColor,
            child: Row(
              children: const [
                HSpacer(
                  sizeFactor: SizeFactor.quater,
                ),
                Icon(
                  Icons.delete_rounded,
                  color: white,
                ),
              ],
            ),
          ),
          key: ObjectKey(notification),
          child: PigExpansionTile(
            // tilePadding: EdgeInsets.all(hPadding(0.25)),
            expandedAlignment: Alignment.centerLeft,
            backgroundColor: transparent,
            childrenPadding: EdgeInsets.only(
              right: hPadding(0.5),
              left: hPadding(0.5),
              bottom: vPadding(0.25),
            ),
            title: ListTile(
              title: Heading2(
                notification.title,
                letterSpacing: 1.0,
                color: black,
              ),
              subtitle: SubTitle(
                formattedDate(notification.time),
                color: grey,
                bold: true,
              ),
            ),
            children: [
              SubTitle(
                notification.description,
                color: black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
