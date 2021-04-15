//~ This is a notification card with title and date on it.
//~ which is just a overview of the notification.
//& Made by PIG

import 'package:flutter/material.dart';
import 'package:pig/utils/date_time.dart';

import '../../../../../config/config.dart';
import '../../../../../models/notification/notification.dart' as n;
import '../../../../../widgets/global_utility_widgets.dart';

class NotificationCard extends StatelessWidget {
  /// notification class contains all parameters like [time] which can be used to
  /// visualize the card
  final n.Notification notification;

  /// onTap a [NotificationOverView] is shown.
  final VoidCallback onTap;
  const NotificationCard({
    Key? key,
    required this.onTap,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: hPadding(0.5)),
        child: PigCube(
          // height: 125.0,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: vPadding(0.25),
              horizontal: hPadding(0.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ///[title] of the notification is shown here
                  notification.title,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: rSHeight(15),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),

                ///[time] of the notification is shown here
                SubText(
                  "${notification.time.day.toString()} ${months[notification.time.month - 1]} ${notification.time.year}",
                  color: grey,
                  bold: true,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
