final List<String> _months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

// ignore: unused_element
final List<String> _days = [
  'M',
  'T',
  'W',
  'Th',
  "F",
  'S',
  'Su',
];

String formattedDate(DateTime? time) {
  final DateTime _time = time ?? DateTime.now();
  return "${_time.day.toString()} ${_months[_time.month - 1]} ${_time.year}";
}
