import 'dart:convert';
import 'package:http/http.dart' as http;

// 👇 FIXED import (relative, not package:)
import 'template_model.dart';

class TemplatesService {
  Future<List<MagazineTemplate>> fetchTemplates() async {
    final String url = "https://raw.githubusercontent.com/unfae/MagzineMaker/dev/remote_templates/templates.json";

    final response = await http.get(Uri.parse(url));

    try {
      final response = await http.get(Uri.parse(templatesUrl));
      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        return data.map((e) => MagazineTemplate.fromJson(e)).toList();
      } else {
        throw Exception('Server returned ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load templates: $e');
    }

  }
}
