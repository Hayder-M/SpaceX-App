class Mission {
  final String id;
  final String name;
  final String? description;
  final List<String> manufacturers;
  final DateTime? date;
  final String? wikipedia;
  final String webUrl;

  Mission(
      {required this.id,
      required this.name,
      this.description,
      required this.manufacturers,
      this.date,
      this.wikipedia,
      required this.webUrl});

  factory Mission.fromJson(Map<String, dynamic> json) {
    return Mission(
      id: json['id'] ?? '',
      name: json['name'] ?? 'SpaceX Mission',
      description: json['description'],
      manufacturers: List<String>.from(json['manufacturers'] ?? []),
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      webUrl: json['website'] ?? 'https://www.spacex.com/',
    );
  }

  get website => null;
}
