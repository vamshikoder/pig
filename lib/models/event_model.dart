class Event {
  Event({
    required this.eventName,
    required this.from,
    required this.host,
    this.to,
  });

  String eventName;
  String host;
  DateTime from;
  DateTime? to;
}
