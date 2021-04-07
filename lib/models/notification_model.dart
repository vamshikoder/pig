//& Made by PIG

class Notification {
  ///[title] max [30] characters
  final String title;
  final DateTime time;

  ///[description] max [600] characters
  final String description;
  final String author;
  final String? designation;

  Notification({
    required this.title,
    required this.time,
    required this.description,
    required this.author,
    this.designation = "",
  });
}
