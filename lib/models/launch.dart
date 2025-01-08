class Launch {
  final String id;
  final String name;
  final String? details;
  final DateTime? date;
  final String? wikipedia;
  final String webUrl;

  Launch(
      {required this.id,
      required this.name,
      this.details,
      this.date,
      this.wikipedia,
      required this.webUrl});

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      id: json['id'] ?? '',
      name: json['name'] ?? 'SpaceX Launch',
      details: json['details'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      webUrl: json['website'] ?? 'https://www.spacex.com/',
    );
  }
}
