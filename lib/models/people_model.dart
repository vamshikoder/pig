class People {
  final String email;
  final String name;
  final bool isManager;
  final String branch;
  final int? year;
  final int? section;
  final String? hallticketNumber;

  People({
    required this.email,
    required this.name,
    required this.isManager,
    required this.branch,
    this.year,
    this.section,
    this.hallticketNumber,
  });
}
