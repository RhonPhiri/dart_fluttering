class Name {
  final String first;
  final String last;

  String get fullName => '$first $last';

  const Name({required this.first, required this.last});
}
