class TemplateModel {
  final String id;
  final String name;
  final String thumbnailUrl;
  final String previewUrl;

  TemplateModel({
    required this.id,
    required this.name,
    required this.thumbnailUrl,
    required this.previewUrl,
  });

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return TemplateModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      thumbnailUrl: json['thumbnail'] ?? '',
      previewUrl: json['preview'] ?? '',
    );
  }
}
