import 'package:flutter/material.dart';

import '/config/config.dart';

import '/models/event/event.dart';

import '/widgets/global_utility_widgets.dart';
import '/widgets/pig_expansion_tile.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final Color? color;
  final bool? expanded;
  const EventCard({
    Key? key,
    required this.event,
    this.color,
    this.expanded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color _color = color ?? primaryColor.withOpacity(0.7);
    final _expanded = expanded ?? false;
    return ClipRRect(
      borderRadius: lightBorderRadius,
      child: PigExpansionTile(
        initiallyExpanded: _expanded,
        maintainState: true,
        iconChangeColor: _color,
        expandedAlignment: Alignment.centerLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        backgroundColor: _color,
        collapsedBackgroundColor: _color,
        title: Container(
          height: 30,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: lightBorderRadius,
          ),
          child: Row(
            children: const [
              HSpacer(
                sizeFactor: SizeFactor.quater,
              ),

              ///[event] name
              SubText(
                // event.eventName,
                "MID Exams",
                color: white,
              ),
              HSpacer(
                sizeFactor: SizeFactor.quater,
              ),

              ///[event] start date.
              SubText(
                // formattedDate(event.from),
                "21 Apr 1982",
                bold: true,
                color: black,
              ),
              Spacer(),
              HSpacer(
                sizeFactor: SizeFactor.quater,
              ),
            ],
          ),
        ),

        /// [author] of the [event]
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: SubText(
                "VANHSIRKI",
                color: white,
                bold: true,
              ),
            ),
          ],
        ),
        children: [
          PigPaddingContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///[from:] event is started.
                Row(
                  children: const [
                    SubTitle(
                      "From : ",
                      color: white,
                    ),
                    SubTitle(
                      '21 Apr 1982',
                      color: black,
                      bold: true,
                    ),
                    SubTitle(
                      " 5:30 PM",
                      color: grey,
                    )
                  ],
                ),

                ///[to] event is ended
                Row(
                  children: const [
                    SubTitle(
                      "To     : ",
                      color: white,
                    ),
                    SubTitle(
                      '20 Sep 2000',
                      color: black,
                      bold: true,
                    ),
                    SubTitle(
                      " 5:30 PM",
                      color: grey,
                    )
                  ],
                ),
                const Divider(),

                ///[event] description
                const SubTitle(
                  "people who are interseted in joining in hackthon conducted by ace engineering college shall give their namespeople",
                  color: black,
                ),
              ],
            ),
          ),
          const VSpacer(
            sizeFactor: SizeFactor.quater,
          )
        ],
      ),
    );
  }
}
