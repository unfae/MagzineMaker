import 'dart:convert';
import 'package:http/http.dart' as http;

// 👇 FIXED import (relative, not package:)
import 'template_model.dart';

class TemplatesService {
  Future<List<MagazineTemplate>> fetchTemplates() async {
    final String url = "https://raw.githubusercontent.com/unfae/MagzineMaker/main/remote_templates/templates.json";
    


    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        // Extract the actual list from the JSON object
        final List data = decoded['templates'];
        
        return data.map((e) => MagazineTemplate.fromJson(e)).toList();
      } else {
        throw Exception('Server returned ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load templates: $e');
    }

  }
}
