//~ This is a notification card with title and date on it.
//~ which is just a overview of the notification.
//& Made by PIG

import 'package:flutter/material.dart';

import '../../../../../config/config.dart';

import '../../../../../models/notification/notification.dart' as n;

import '../../../../../utils/date_time.dart';

import '../../../../../widgets/global_utility_widgets.dart';

class NotificationCard extends StatelessWidget {
  /// notification class contains all parameters like [time] which can be used to
  /// visualize the card
  final n.Notification notification;
  final Color? color;

  /// onTap a [NotificationOverView] is shown.
  final VoidCallback onTap;
  const NotificationCard(
      {Key? key, required this.onTap, required this.notification, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color _color = color ?? primaryColor.withOpacity(0.3);
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: notification,
        child: Padding(
          padding: EdgeInsets.only(right: hPadding(0.5)),
          child: PigCube(
            color: _color,
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
                  Expanded(
                    child: Text(
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
                  ),

                  ///[time] of the notification is shown here
                  SubText(
                    formattedDate(notification.time),
                    color: grey,
                    bold: true,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
