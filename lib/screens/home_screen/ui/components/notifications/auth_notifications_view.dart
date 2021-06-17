//^ Available only to authorized users
//~ This file is used to  create a overlay over the [HomeScaffold]
//~ which shows Notifications made by the user.
//& Made by PIG

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import '../../../../../config/config.dart';

import '../../../../../data/dummie_notifications_data.dart';

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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: white,
          shape: BoxShape.circle,
          boxShadow: lightBoxShadow(),
        ),
        child: IconButton(
          icon: const Icon(Icons.add_rounded),
          onPressed: () {
            Get.back();
            context
                .read(showPostNotificationStateProvider)
                .showPostNotification();
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
          child: Center(
            child: PigPaddingContainer(
              child: Container(
                height: screenHeight * 0.85,
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
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.73,
                        width: double.infinity,
                        child: ListView.separated(
                          clipBehavior: Clip.antiAlias,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(8.0),
                          //* use this for real data that need to be passed to the APP
                          // children: authNotificationsState.isEmpty
                          // ? [
                          //         const Center(
                          //           child: SubText(
                          //             "you've not made any notifications.",
                          //             color: errorColor,
                          //           ),
                          //         ),
                          //       ]
                          //     : authNotificationsState.map((val) {
                          //         return AuthNotificationTile(
                          //        );
                          //            key: ObjectKey(val),
                          //           notification: val,
                          //       }).toList(),

                          //! THIS IS DUMMY DATA FROM [DATA] FOLDER
                          itemBuilder: (context, index) {
                            return AuthNotificationTile(
                              key: ObjectKey(notifications[index]),
                              notification: notifications[index],
                              color: primaryColor.withOpacity(0.7),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return VSpacer(
                              key: ObjectKey(notifications[index]),
                              sizeFactor: SizeFactor.min,
                            );
                          },
                          itemCount: notifications.length,
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
    );
  }
}
