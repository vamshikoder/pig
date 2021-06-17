//~ This is a custom calender.
//& Made by PIG

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:decorated_icon/decorated_icon.dart';

import './all_events_view.dart';
import './event_card.dart';
import './event_creator.dart';

import '/config/config.dart';

import '/models/event/event.dart';

import '/providers/user_state_provider.dart';

import '/widgets/pig_expansion_tile.dart';

///import [flutter_riverpod.dart]
class UpcommingEvents extends ConsumerWidget {
  const UpcommingEvents({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final userState = watch(userStateProvider.state);
    return Container(
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: white,
        boxShadow: lightBoxShadow(),
        borderRadius: lightBorderRadius,
      ),
      child: ClipRRect(
        borderRadius: lightBorderRadius,
        child: Column(
          children: [
            Container(
              width: screenWidth * 0.9,
              color: white,
              child: PigExpansionTile(
                backgroundColor: white,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VSpacer(
                      sizeFactor: SizeFactor.quater,
                    ),
                    Hero(
                      tag: const ValueKey("calendarTitle"),
                      child: Material(
                        color: transparent,
                        child: Row(
                          children: [
                            const Expanded(
                              child: Heading2(
                                "Calendar",
                                color: black,
                              ),
                            ),

                            ///[Authorized] users can create events.
                            if (userState.isAuthorized)
                              IconButton(
                                onPressed: () {
                                  Get.to(
                                    () => EventCreator(),
                                    transition: Transition.downToUp,
                                  )!
                                      .then((value) {
                                    log(value.toString());
                                  });
                                  // final _date = DateTime.now();

                                  // /// opens a  [DatePicker] to select date for the [Event ]
                                  // showDatePicker(
                                  //   context: context,
                                  //   initialDate: _date,
                                  //   firstDate: DateTime(_date.year - 1),
                                  //   lastDate: DateTime(_date.year + 1),
                                  //   builder:
                                  //       (BuildContext context, Widget? child) {
                                  //     return Theme(
                                  //       /// overriding the default color theme.
                                  //       data: ThemeData.light().copyWith(
                                  //         colorScheme: const ColorScheme.dark(
                                  //           primary: primaryColor,
                                  //           onPrimary: white,
                                  //           surface: primaryColor,
                                  //           onSurface: black,
                                  //         ),
                                  //         dialogBackgroundColor: white,
                                  //       ),
                                  //       child: child!,
                                  //     );
                                  //   },
                                  // ).then(
                                  //   (datePickerDateTime) => showDialog(
                                  //     context: context,
                                  //     builder: (context) {
                                  //       final String _formattedDate =
                                  //           formattedDate(datePickerDateTime);
                                  //       return EventDescriptionModalBottomSheet(
                                  //         _formattedDate,
                                  //       );
                                  //     },
                                  //   ),
                                  // );
                                },
                                icon: DecoratedIcon(
                                  Icons.event_rounded,
                                  size: 25,
                                  color: primaryColor,
                                  shadows: [
                                    BoxShadow(
                                      blurRadius: 15.0,
                                      color: primaryColor.withOpacity(0.8),
                                      offset: const Offset(3.0, 3.0),
                                    ),
                                  ],
                                ),
                              )
                            else
                              Container(),
                            const HSpacer(
                              sizeFactor: SizeFactor.full,
                            )
                          ],
                        ),
                      ),
                    ),
                    const Divider(),
                    const VSpacer(
                      sizeFactor: SizeFactor.min,
                    ),
                    EventCard(
                      expanded: true,
                      event: Event(
                        eventName: "",
                        from: DateTime.now(),
                        host: "vanhsirki",
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                    ),
                  ],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                      right: 10.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        for (var i in [4, 5, 6, 7])
                          Column(
                            children: [
                              EventCard(
                                event: Event(
                                  eventName: "$i",
                                  from: DateTime.now(),
                                  host: "$i",
                                ),
                                color: Colors.accents[i].withOpacity(0.4),
                              ),
                              const VSpacer(
                                sizeFactor: SizeFactor.min,
                              )
                            ],
                          ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => AllEventsView());
                          },
                          child: const SubText(
                            "See All",
                            bold: true,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
