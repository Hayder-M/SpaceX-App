class Launch {
  final String id;
  final String name;
  final String? details;

  Launch({required this.id, required this.name, this.details});

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      id: json['id'] ?? '',
      name: json['name'] ?? 'SpaceX Launch',
      details: json['details'],
    );
  }
}
