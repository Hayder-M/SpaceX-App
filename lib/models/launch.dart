class Launch {
  final String id;
  final String name;
  final String? details; // Mark details as nullable

  Launch({required this.id, required this.name, this.details});

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      id: json['id'] ?? '', // Provide a default value if id is null
      name: json['name'] ?? 'SpaceX Launch', // Provide a default name
      details: json['details'], // Allow null values
    );
  }
}
