//^ Available only to authorized users
//~ This file is used to  create a overlay over the [HomeScaffold]
//~ which shows Notifications made by the user.
//& Made by PIG

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import '../../../../../config/config.dart';

// import '../../../../../data/dummie_notifications_data.dart';

import '../../../../../widgets/global_utility_widgets.dart';

import '../../../providers/notifications_state_provider.dart';

import './auth_notification_tile.dart';

class AuthNotificationsView extends ConsumerWidget {
  const AuthNotificationsView({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    // ignore: unused_local_variable
    final authNotificationsState = watch(authNotificationsStateProvider.state);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: PigArrow(
          turns: 4,
          onTap: () => Get.back(),
        ),
      ),
      body: Container(
        color: transparent,
        height: screenHeight,
        width: double.infinity,
        child: BackdropFilter(
          ///this blurs the [background] for a focused feeling
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: GestureDetector(
            onTap: () {},
            child: Center(
              child: PigPaddingContainer(
                child: Container(
                  height: screenHeight * 0.8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: deepBorderRadius,
                    boxShadow: boxShadow(),
                  ),
                  child: PigPaddingContainer(
                    verticalPadding: true,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// this is the title shown for [AuthNotifications]
                            RichText(
                              text: TextSpan(
                                text: "NOTIFICATIONS",
                                style: TextStyle(
                                  color: primaryColor,
                                  // fontFamily: 'Poppins',
                                  fontSize: rSHeight(16),
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 2.5,
                                ),
                                children: [
                                  TextSpan(
                                    text: " YOU MADE",
                                    style: TextStyle(
                                      color: grey,
                                      fontFamily: 'Poppins',
                                      fontSize: rSHeight(16),
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 2.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.close_rounded,
                                color: errorColor,
                              ),
                              onPressed: () {
                                ///this closes the [Auth Notifications List]
                                context
                                    .read(showAuthNotificationsStateProvider)
                                    .showAuthNotifications();
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: screenHeight * 0.67,
                          width: double.infinity,
                          child: ListView(
                            clipBehavior: Clip.antiAlias,
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(8.0),
                            //* use this for real data that need to be passed to the APP
                            children: authNotificationsState.isEmpty
                                ? [
                                    const Center(
                                      child: SubText(
                                        "oh you've not made any notifications.",
                                        color: errorColor,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        const SubText('you can add here.'),
                                        IconButton(
                                          tooltip: "post notification.",
                                          splashColor: transparent,
                                          highlightColor: transparent,
                                          icon: const Icon(
                                            Icons.add,
                                            color: primaryColor,
                                          ),
                                          onPressed: () {
                                            context
                                                .read(
                                                    showAuthNotificationsStateProvider)
                                                .showAuthNotifications();

                                            /// it allows the [Authorized] to open a [PostNotification]
                                            context
                                                .read(
                                                    showPostNotificationStateProvider)
                                                .showPostNotification();
                                            // }
                                          },
                                        ),
                                      ],
                                    ),
                                  ]
                                : authNotificationsState.map((val) {
                                    return AuthNotificationTile(
                                      key: ObjectKey(val),
                                      notification: val,
                                    );
                                  }).toList(),

                            //! THIS IS DUMMY DATA FROM [DATA] FOLDER
                            // children: notifications.map((val) {
                            //   return AuthNotificationTile(
                            //     key: ObjectKey(val),
                            //     notification: val,
                            //   );
                            // }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
