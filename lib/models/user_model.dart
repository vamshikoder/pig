//& Made by PIG

class User {
  final String email;
  final String name;
  final bool isAuthorized;
  final String branch;
  final int? year;
  final int? section;
  final String? hallticketNumber;

  User({
    required this.email,
    required this.name,
    required this.isAuthorized,
    required this.branch,
    this.year,
    this.section,
    this.hallticketNumber,
  });
}
