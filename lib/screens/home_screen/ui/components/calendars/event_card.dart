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
              SubText(
                // event.eventName,
                "MID Exams",
                color: white,
              ),
              HSpacer(
                sizeFactor: SizeFactor.quater,
              ),
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
        children: const [
          PigPaddingContainer(
            child: SubTitle(
              // event.descripton
              "people who are interseted in joining in hackthon conducted by ace engineering college shall give their namespeople",
              color: black,
            ),
          ),
          VSpacer(
            sizeFactor: SizeFactor.quater,
          )
        ],
      ),
    );
  }
}
