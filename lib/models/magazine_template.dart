import 'dart:convert';

class MagazineTemplate {
  final String id;
  final String name;
  final String thumbnailUrl;
  final String zipUrl;

  MagazineTemplate({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.zipUrl,
  });

  factory MagazineTemplate.fromJson(Map<String, dynamic> json) {
    return MagazineTemplate(
      id: json['id'],
      name: json['name'],
      thumbnailUrl: json['thumbnail_url'],
      zipUrl: json['zip_url'],
    );
  }

  static List<MagazineTemplate> listFromJson(String jsonStr) {
    final data = json.decode(jsonStr);
    final List list = data['templates'];
    return list.map((e) => MagazineTemplate.fromJson(e)).toList();
  }
}
