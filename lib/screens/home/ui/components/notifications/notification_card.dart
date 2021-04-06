import 'package:flutter/material.dart';

import '../../../../../config/config.dart';
import '../../../../../models/notification.dart' as n;
import '../../../../../widgets/global_utility_widgets.dart';

class NotificationCard extends StatelessWidget {
  final n.Notification notification;
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
        child: CContainer(
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
                  notification.title,
                  overflow: TextOverflow.fade,
                  maxLines: 2,
                  style: const TextStyle(
                    color: black,
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                SubText(
                  "${notification.time.day.toString()} ${n.months[notification.time.month - 1]} ${notification.time.year}",
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
