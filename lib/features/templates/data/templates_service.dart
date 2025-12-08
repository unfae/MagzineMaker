import 'dart:convert';
import 'package:http/http.dart' as http;
import 'template_model.dart';

class TemplatesService {
  final String url =
      "https://raw.githubusercontent.com/unfae/MagzineMaker/dev/remote_templates/templates.json";

  Future<List<MagazineTemplate>> fetchTemplates() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        print("Templates fetched: ${data.length}");
        return data.map((e) => MagazineTemplate.fromJson(e)).toList();
      } else {
        print('Server returned: ${response.statusCode}');
        throw Exception('Failed to load templates');
      }
    } catch (e) {
      print("Error fetching templates: $e");
      throw Exception('Failed to load templates: $e');
    }
  }
}
