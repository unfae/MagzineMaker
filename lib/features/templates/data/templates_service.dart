import 'dart:convert';
import 'package:http/http.dart' as http;
import 'template_model.dart';

class TemplatesService {
  final String url = "PASTE_YOUR_GITHUB_RAW_URL_HERE";

  Future<List<MagazineTemplate>> fetchTemplates() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => MagazineTemplate.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load templates");
    }
  }
}
