class Mission {
  final String id;
  final String name;
  final String? description;
  final List<String> manufacturers;

  Mission({
    required this.id,
    required this.name,
    this.description,
    required this.manufacturers,
  });

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      id: json['id'] ?? '',
      name: json['name'] ?? 'SpaceX Mission',
      description: json['description'],
      manufacturers: List<String>.from(json['manufacturers'] ?? []),
    );
  }
}
