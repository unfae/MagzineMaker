class MagazineTemplate {
  final String id;
  final String name;
  final String thumbnail;
  final int pages;
  final String category;

  MagazineTemplate({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.pages,
    required this.category,
  });

  factory MagazineTemplate.fromJson(Map<String, dynamic> json) {
    return MagazineTemplate(
      id: json['id'],
      name: json['name'],
      thumbnail: json['thumbnail'],
      pages: json['pages'],
      category: json['category'],
    );
  }
}
