import 'package:pig/models/event/event.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// all the notifications this user has got.
class EventsListNotifier extends StateNotifier<List<Event>> {
  EventsListNotifier() : super([]);
}

final eventsListStateProvider =
    StateNotifierProvider<EventsListNotifier>((ref) {
  return EventsListNotifier();
});

/// this stores the events that the user[Authorized] has made.
class YourEventsNotifier extends StateNotifier<List<Event>> {
  YourEventsNotifier() : super([]);
}

final yourEventsStateProvider =
    StateNotifierProvider<YourEventsNotifier>((ref) {
  return YourEventsNotifier();
});
