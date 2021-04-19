//~ This shows the Overview of the [Notification] which is tapped
//& Made by PIG

import 'dart:ui';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/config.dart';

import '../../../../../models/notification/notification.dart' as n;

import '../../../../../utils/date_time.dart';

import '../../../../../widgets/global_utility_widgets.dart';

import '../../../providers/notifications_state_provider.dart';

class NotificationOverviewView extends ConsumerWidget {
  final n.Notification notification;
  const NotificationOverviewView({
    // required Key key,
    required this.notification,
  });

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Container(
      color: transparent,
      height: screenHeight,
      width: double.infinity,
      child: BackdropFilter(
        ///this blurs the [background] for a focused feeling
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Center(
          child: PigPaddingContainer(
            child: Container(
              height: screenHeight * 0.7,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: deepBorderRadius,
                boxShadow: boxShadow,
              ),
              child: PigPaddingContainer(
                verticalPadding: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Heading1(
                            /// [title] will be shown here
                            notification.title,
                            color: black,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.close_rounded,
                            color: errorColor,
                          ),
                          onPressed: () {
                            ///this closes the [Notification Overview]

                            context
                                .read(showNotificationStateProvider)
                                .showNotification();
                          },
                        )
                      ],
                    ),

                    ///this shows the [time] i.e the date of creation
                    Heading2(
                        '${notification.time.day.toString()} ${months[notification.time.month - 1]} ${notification.time.year}'),

                    ///this shows the [time] i.e the time of creation
                    SubText(
                      DateFormat('jm').format(notification.time),
                      color: grey.withOpacity(0.8),
                    ),
                    const VSpacer(
                      sizeFactor: SizeFactor.half,
                    ),
                    Text(
                      ///[description] of the notification.
                      notification.description,
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: black,
                        // fontFamily: 'Poppins',
                        fontSize: rSHeight(14),
                        fontWeight: FontWeight.w400,
                        // letterSpacing: letterSpacing,
                        wordSpacing: 1.0,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Author',
                              style: TextStyle(
                                color: primaryColor,
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2.5,
                              ),
                            ),

                            ///This show the [Notification] creator
                            Text(
                              notification.author.toUpperCase(),
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                color: black,
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 2.0,
                              ),
                            ),
                            Text(
                              notification.designation!,
                              style: const TextStyle(
                                color: grey,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.0,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
