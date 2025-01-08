class Launch {
  final String id;
  final String name;
  final String? details;
  final DateTime? date; // Add date attribute

  Launch({required this.id, required this.name, this.details, this.date});

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      id: json['id'] ?? '',
      name: json['name'] ?? 'SpaceX Launch',
      details: json['details'],
      // Parse the date if it exists in the JSON, otherwise use null
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
    );
  }
}
