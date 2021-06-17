//~ This shows the Overview of the [Notification] which is tapped
//& Made by PIG

import 'dart:ui';

import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import '../../../../../config/config.dart';

import '../../../../../models/notification/notification.dart' as n;

import '../../../../../utils/date_time.dart';

import '../../../../../widgets/global_utility_widgets.dart';

class NotificationOverviewView extends ConsumerWidget {
  final n.Notification notification;
  final Color? color;
  const NotificationOverviewView({
    required this.notification,
    this.color,
  });

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final Color _color = color ?? Colors.white;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: transparent,
        elevation: 0.0,
        leading: PigArrow(
          turns: 4,
          onTap: () => Get.back(),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Container(
            height: screenHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
                image: AssetImage('assets/images/notifications 2.jpg'),
              ),
            ),
          ),
          Positioned(
            bottom: rSHeight(50),
            child: SizedBox(
              height: screenHeight * 0.8,
              width: screenWidth * 0.9,
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 2,
                  sigmaY: 2,
                ),
                child: Expanded(
                  child: Center(
                    child: Hero(
                      tag: notification,
                      child: Material(
                        color: transparent,
                        child: SizedBox(
                          height: screenHeight * 0.7,
                          width: screenWidth * 0.9,
                          child: Container(
                            decoration: BoxDecoration(
                              color: _color,
                              borderRadius: deepBorderRadius,
                              boxShadow: boxShadow(),
                            ),
                            child: PigPaddingContainer(
                              verticalPadding: true,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                          Get.back();
                                          // context
                                          //     .read(showNotificationStateProvider)
                                          //     .showNotification();
                                        },
                                      )
                                    ],
                                  ),

                                  ///this shows the [time] i.e the date of creation
                                  Heading2(formattedDate(notification.time)),

                                  ///this shows the [time] i.e the time of creation
                                  SubText(
                                    DateFormat('jm').format(notification.time),
                                    color: grey.withOpacity(0.8),
                                  ),
                                  const VSpacer(
                                    sizeFactor: SizeFactor.half,
                                  ),
                                  Expanded(
                                    child: Text(
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
                                  ),
                                  const Spacer(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
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
                                            notification.designation == null
                                                ? " "
                                                : notification.designation!,
                                            // notification.designation!,
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
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
