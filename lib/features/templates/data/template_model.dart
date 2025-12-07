class MagazineTemplate {
  final String id;
  final String name;
  final String thumbnailUrl;
  final int pages;
  final String category;

  MagazineTemplate({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.pages,
    required this.category,
  });

  factory MagazineTemplate.fromJson(Map<String, dynamic> json) {
    return MagazineTemplate(
      id: json['id'],
      name: json['name'],
      thumbnailUrl: json['thumbnailUrl'],
      pages: json['pages'],
      category: json['category'],
    );
  }
}
