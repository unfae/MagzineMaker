import 'dart:convert';
import 'package:http/http.dart' as http;

// 👇 FIXED import (relative, not package:)
import 'template_model.dart';

class TemplatesService {
  Future<List<MagazineTemplate>> fetchTemplates() async {
    final String url = "https://raw.githubusercontent.com/unfae/MagzineMaker/refs/heads/dev/remote_templates/templates.json";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => MagazineTemplate.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load templates");
    }
  }
}
