class People {
  final String name;
  final bool isManager;
  final String pigCode;
  final String? hallticketNumber;

  People({
    required this.pigCode,
    required this.name,
    required this.isManager,
    this.hallticketNumber,
  });
}
