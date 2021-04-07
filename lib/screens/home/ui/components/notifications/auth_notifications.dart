//^ Available only to authorized users
//~ This file is used to  create a overlay over the [HomeScaffold]
//~ which shows Notifications made by the user.
//& Made by PIG

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../config/config.dart';

import '../../../../../widgets/global_utility_widgets.dart';

import '../../../providers/notifications_state_provider.dart';

class AuthNotifications extends ConsumerWidget {
  const AuthNotifications({
    Key? key,
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
          child: PigPaddingContainer(
            child: Container(
              height: _sHeight * 0.8,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: white,
                borderRadius: deepBorderRadius,
                boxShadow: boxShadow,
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
                            ///this closes the [Notification Overview]
                            context
                                .read(showAuthNotificationsStateProvider)
                                .showAuthNotifications();
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: _sHeight * 0.67,
                      width: double.infinity,
                      child: GridView(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.all(8.0),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        children: const [
                          AuthNotificationCard(),
                          AuthNotificationCard(),
                          AuthNotificationCard(),
                          AuthNotificationCard(),
                          AuthNotificationCard(),
                          AuthNotificationCard(),
                          AuthNotificationCard(),
                          AuthNotificationCard(),
                          AuthNotificationCard(),
                          AuthNotificationCard(),
                          AuthNotificationCard(),
                        ],
                      ),
                    ),
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

class AuthNotificationCard extends StatelessWidget {
  const AuthNotificationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: hPadding(0.12),
        vertical: vPadding(0.12),
      ),
      child: const PigCube(
        child: Center(
          child: Text("todo auth notification card"),
        ),
      ),
    );
  }
}
