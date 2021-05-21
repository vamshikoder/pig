import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pig/utils/date_time.dart';

import '/config/config.dart';

import '/widgets/global_utility_widgets.dart';

final startDateStateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now();
});

final endDateStateProvider = StateProvider<DateTime>((ref) {
  return DateTime.now().add(const Duration(days: 1));
});

void changeStartDate(StateProvider<DateTime> provider, DateTime? dateTime,
    BuildContext context) {
  final _dateTime = dateTime ?? DateTime.now();
  context.read(provider).state = _dateTime;
}

void changeEndDate(StateProvider<DateTime> provider, DateTime? dateTime,
    BuildContext context) {
  final _dateTime = dateTime ?? DateTime.now().add(const Duration(days: 1));
  context.read(provider).state = _dateTime;
}

class EventCreator extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
        appBar: AppBar(
          title: const Heading2("Create Event"),
          elevation: 0.0,
          backgroundColor: white,
          leading: PigArrow(
            onTap: () => Get.back(),
            turns: 4,
          ),
        ),
        body: Column(
          children: [
            const VSpacer(
              sizeFactor: SizeFactor.quater,
            ),
            const StartEndDatePickers()
          ],
        ));
  }
}

class StartEndDatePickers extends ConsumerWidget {
  const StartEndDatePickers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final startDateState = watch(startDateStateProvider).state;
    final endDateState = watch(endDateStateProvider).state;
    return PigPaddingContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SubText(
                "Start Date",
                color: grey,
              ),
              GestureDetector(
                onTap: () {
                  final _dateTime = DateTime.now();

                  /// opens a  [DatePicker] to select date for the [Event ]
                  showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: _dateTime,
                    lastDate: DateTime(_dateTime.year + 1),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        /// overriding the default color theme.
                        data: ThemeData.light().copyWith(
                          colorScheme: const ColorScheme.dark(
                            primary: primaryColor,
                            onPrimary: white,
                            surface: primaryColor,
                            onSurface: black,
                          ),
                          dialogBackgroundColor: white,
                        ),
                        child: child!,
                      );
                    },
                  ).then(
                    (dateTime) => changeStartDate(
                        startDateStateProvider, dateTime, context),
                  );
                },
                child: Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: lightBoxShadow(),
                    borderRadius: lightBorderRadius,
                  ),
                  child: Center(
                    child: SubText(
                      formattedDate(startDateState),
                      bold: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const SubText(
                "End Date",
                color: grey,
              ),
              GestureDetector(
                onTap: () {
                  final _dateTime = DateTime.now();

                  /// opens a  [DatePicker] to select date for the [Event ]
                  showDatePicker(
                    context: context,
                    initialDate: _dateTime.add(const Duration(days: 1)),
                    firstDate: _dateTime.add(const Duration(days: 1)),
                    lastDate: DateTime(_dateTime.year + 1),
                    builder: (BuildContext context, Widget? child) {
                      return Theme(
                        /// overriding the default color theme.
                        data: ThemeData.light().copyWith(
                          colorScheme: const ColorScheme.dark(
                            primary: primaryColor,
                            onPrimary: white,
                            surface: primaryColor,
                            onSurface: black,
                          ),
                          dialogBackgroundColor: white,
                        ),
                        child: child!,
                      );
                    },
                  ).then(
                    (dateTime) =>
                        changeEndDate(endDateStateProvider, dateTime, context),
                  );
                },
                child: Container(
                  height: 30,
                  width: 150,
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: lightBoxShadow(),
                    borderRadius: lightBorderRadius,
                  ),
                  child: Center(
                    child: SubText(
                      formattedDate(endDateState),
                      bold: true,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
