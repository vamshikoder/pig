import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/models/event/event.dart';

///^ These hold all lists of events.
///
///* This holds the events that the user has got.
class EventsListNotifier extends StateNotifier<List<Event>> {
  EventsListNotifier() : super([]);
}

final eventsListStateProvider =
    StateNotifierProvider<EventsListNotifier>((ref) {
  return EventsListNotifier();
});

///* this stores the events that the user[Authorized] has made.
class YourEventsNotifier extends StateNotifier<List<Event>> {
  YourEventsNotifier() : super([]);
  void insEvent(Event event) {
    state.add(event);
  }

  void delEvent(Event event) {
    state.removeWhere((element) => element == event);
  }
}

final yourEventsStateProvider =
    StateNotifierProvider<YourEventsNotifier>((ref) {
  return YourEventsNotifier();
});

///^ All the below providers are used to manage the TIME in the event creation
///
///* holds the START time of the event
final startTimeStateProvider = StateProvider<TimeOfDay>((ref) {
  return const TimeOfDay(hour: 4, minute: 47);
});

///* holds the END time of the event
final endTimeStateProvider = StateProvider<TimeOfDay>((ref) {
  return const TimeOfDay(hour: 4, minute: 47);
});

/// This function allows to change the [time] in the start and end time providers
void updateTime(
    StateProvider<TimeOfDay> provider, TimeOfDay? time, BuildContext context) {
  final _time = time ?? TimeOfDay.now();
  context.read(provider).state = _time;
}

///^ All the below providers are used to manage the DATES in the event creation
///
///* This holds the start date selected by the user.
// class StartDateStateNotifier extends StateNotifier<DateTime> {
//   StartDateStateNotifier() : super(DateTime.now());

//   // ignore: use_setters_to_change_properties
//   void updateDate(DateTime dateTime) {
//     state = dateTime;
//   }
// }

// final startDateStateNotifierProvider =
//     StateNotifierProvider<StartDateStateNotifier>((ref) {
//   return StartDateStateNotifier();
// });

// ///* This holds the end date that is selected by the user.
// class EndDateStateNotifier extends StateNotifier<DateTime> {
//   EndDateStateNotifier() : super(DateTime.now());
//   // ignore: use_setters_to_change_properties
//   void updateDate(DateTime dateTime) {
//     state = dateTime;
//   }
// }

// final endDateStateNotifierProvider =
//     StateNotifierProvider<EndDateStateNotifier>((ref) {
//   return EndDateStateNotifier();
// });

///* when ever the calendar is closed the initial date will be set to current date
///* instead of the selected date. this tells the calendar to show the selected date
///* as the initial date.
///* if nothing is selected then it shows the current date
// class InitialEndDateStateNotifier extends StateNotifier<DateTime> {
//   InitialEndDateStateNotifier() : super(DateTime.now());
//   // ignore: use_setters_to_change_properties
//   void updateDate(DateTime dateTime) {
//     state = dateTime;
//   }
// }

// final initialEndDateStateNotifierProvider =
//     StateNotifierProvider<InitialEndDateStateNotifier>((ref) {
//   return InitialEndDateStateNotifier();
// });

///* This determines the first date to be shown this is set dynamically according to
///* the startdate since the end date cannot be before start date, The first end date
///* will be set to the start date which is selected by the user.
// class FirstEndDateStateNotifier extends StateNotifier<DateTime> {
//   FirstEndDateStateNotifier() : super(DateTime.now());
//   // ignore: use_s`etters_to_change_properties
//   void updateDate(DateTime dateTime) {
//     state = dateTime;
//   }
// }

// final firstEndDateStateNotifierProvider =
//     StateNotifierProvider<FirstEndDateStateNotifier>((ref) {
//   return FirstEndDateStateNotifier();
// });

class DateRangeStateNotifier extends StateNotifier<DateTimeRange> {
  DateRangeStateNotifier()
      : super(
          DateTimeRange(
            start: DateTime.now(),
            end: DateTime.now().add(
              const Duration(days: 1),
            ),
          ),
        );
  // ignore: use_setters_to_change_properties
  void updateDateTimeRange(DateTimeRange dateTimeRange) =>
      state = dateTimeRange;
}

final dateTimeRangeStateNotifierProvider =
    StateNotifierProvider<DateRangeStateNotifier>((ref) {
  return DateRangeStateNotifier();
});

final eventTitleStateProvider = StateProvider<String>((ref) {
  return "";
});

class EventTitleStateNotifier extends StateNotifier<String> {
  EventTitleStateNotifier() : super("");

  // ignore: use_setters_to_change_properties
  void updateEventTitle(String title) => state = title;
}

final eventTitleStateNotifierProvider =
    StateNotifierProvider<EventTitleStateNotifier>((ref) {
  return EventTitleStateNotifier();
});

class EventDescriptionStateNotifier extends StateNotifier<String> {
  EventDescriptionStateNotifier() : super("");
  // ignore: use_setters_to_change_properties
  void updateEventDescription(String title) => state = title;
}

final eventDescriptionStateNotifierProvider =
    StateNotifierProvider<EventDescriptionStateNotifier>((ref) {
  return EventDescriptionStateNotifier();
});

final validEventTitleStateProvider = StateProvider<bool>((ref) {
  return true;
});

bool validateEventTitle(BuildContext context, String value) {
  final String title = value.replaceAll(RegExp(r'\s'), "");

  if (title.isEmpty | (title == "")) {
    context.read(validEventTitleStateProvider).state = false;
    return false;
  }
  context.read(validEventTitleStateProvider).state = true;
  return true;
}

final validEventDescriptionStateProvider = StateProvider<bool>((ref) {
  return true;
});

bool validateEventDescription(BuildContext context, String value) {
  final String title = value.replaceAll(RegExp(r'\s'), "");

  if (title.isEmpty | (title == "")) {
    context.read(validEventDescriptionStateProvider).state = false;
    return false;
  }
  context.read(validEventDescriptionStateProvider).state = true;
  return true;
}
