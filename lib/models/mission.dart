class Mission {
  final String id;
  final String name;
  final String? description; // Mark description as nullable
  final List<String> manufacturers;

  Mission({
    required this.id,
    required this.name,
    this.description,
    required this.manufacturers,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      id: json['id'] ?? '', // Provide a default value
      name: json['name'] ?? 'SpaceX Mission', // Provide a default name
      description: json['description'], // Allow null values
      manufacturers: List<String>.from(
          json['manufacturers'] ?? []), // Default to an empty list
    );
  }
}
