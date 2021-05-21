import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';

import './event_card.dart';

import '/config/config.dart';

import '/models/event/event.dart';

import '/widgets/global_utility_widgets.dart';

class AllEventsView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: transparent,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const PigArrow(
            turns: 4,
          ),
        ),
        title: const Hero(
          tag: ValueKey('calendarTitle'),
          child: Material(
            color: transparent,
            child: Heading2(
              "Calendar",
            ),
          ),
        ),
      ),
      body: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 5,
          sigmaY: 5,
        ),
        child: Column(
          children: const [
            AllEvents(),
            VSpacer(
              sizeFactor: SizeFactor.quater,
            ),
            UserEvents(),
          ],
        ),
      ),
    );
  }
}

class AllEvents extends StatelessWidget {
  const AllEvents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.42,
      width: double.infinity,
      child: PigPaddingContainer(
        sizeFactor: SizeFactor.quater,
        child: PigSheet(
          title: "All Events",
          boxShadow: lightBoxShadow(),
          color: white,
          height: screenHeight * 1,
          child: SizedBox(
            height: screenHeight * 0.34,
            width: double.infinity,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return EventCard(
                  event: Event(
                    eventName: "$index",
                    from: DateTime.now(),
                    host: "$index",
                  ),
                  color: Colors.accents[index].withOpacity(0.4),
                );
              },
              itemCount: 7,
              separatorBuilder: (_, __) {
                return const VSpacer(
                  sizeFactor: SizeFactor.min,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class UserEvents extends StatelessWidget {
  const UserEvents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.43,
      width: double.infinity,
      child: PigPaddingContainer(
        sizeFactor: SizeFactor.quater,
        child: PigSheet(
          title: "Events You Made",
          boxShadow: lightBoxShadow(),
          color: white,
          height: screenHeight * 1,
          child: SizedBox(
            height: screenHeight * 0.35,
            width: double.infinity,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                final _currentEvent = Event(
                  eventName: "$index",
                  from: DateTime.now(),
                  host: "$index",
                );
                return ClipRRect(
                  borderRadius: lightBorderRadius,
                  child: Dismissible(
                    key: ObjectKey(_currentEvent),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {
                      //ignore:missing_enum_constant_in_switch
                      switch (direction) {
                        //* in the future may be add a edit option to the Event
                        // case DismissDirection.endToStart:
                        //   log("Edit the Event");
                        //   break;
                        case DismissDirection.startToEnd:
                          break;
                      }
                    },
                    background: Container(
                      color: errorColor,
                      child: Row(
                        children: const [
                          HSpacer(
                            sizeFactor: SizeFactor.quater,
                          ),
                          Icon(
                            Icons.delete_rounded,
                            color: white,
                          ),
                        ],
                      ),
                    ),
                    child: EventCard(
                      event: _currentEvent,
                      color: Colors.accents[index].withOpacity(0.4),
                    ),
                  ),
                );
              },
              itemCount: 7,
              separatorBuilder: (_, __) {
                return const VSpacer(
                  sizeFactor: SizeFactor.min,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
