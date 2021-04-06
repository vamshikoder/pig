import 'dart:ui';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pig/utils/date_time.dart';

import '../../../../../config/config.dart';

import '../../../../../models/notification_model.dart' as n;

import '../../../../../widgets/global_utility_widgets.dart';

import '../../../providers/notifications_state_provider.dart';

class NotificationOverview extends ConsumerWidget {
  ///This shows the Overview of the [Notification] which is tapped
  final n.Notification notification;

  const NotificationOverview({
    Key? key,
    required this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final Size _size = MediaQuery.of(context).size;
    final double _sHeight = _size.height;

    return Container(
      color: transparent,
      height: _sHeight,
      width: double.infinity,
      child: BackdropFilter(
        ///this blurs the [background] for a focused feeling
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Center(
          child: PContainer(
            child: Container(
              height: _sHeight * 0.6,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: deepBorderRadius,
                boxShadow: boxShadow,
              ),
              child: PContainer(
                verticalPadding: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Heading1(
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
                      notification.description,
                      maxLines: 15,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: black,
                        // fontFamily: 'Poppins',
                        fontSize: rSHeight(14.5),
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
