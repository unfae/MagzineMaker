import 'dart:convert';
import 'package:http/http.dart' as http;
import '../features/templates/template_model.dart';

class TemplateService {
  static const String templatesUrl =
      "https://raw.githubusercontent.com/unfae/MagzineMaker/refs/heads/main/remote_templates/templates.json";

  static Future<List<TemplateModel>> fetchTemplates() async {
    final response = await http.get(Uri.parse(templatesUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => TemplateModel.fromJson(e)).toList();
    } else {
      throw Exception("Failed to fetch templates (code: ${response.statusCode})");
    }
  }
}
