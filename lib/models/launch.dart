class Launch {
  final String id;
  final String name;
  final String? details;
  final DateTime? date;

  Launch({required this.id, required this.name, this.details, this.date});

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      id: json['id'] ?? '',
      name: json['name'] ?? 'SpaceX Launch',
      details: json['details'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
    );
  }
}
