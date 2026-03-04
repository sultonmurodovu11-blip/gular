import 'dart:convert';
import 'package:http/http.dart' as http;

class PexelsService {
  static const String _apiKey = 'nvDXLznOofqj3hYwTAl00g2a4OyoBc6frRNaCAHAcAC5rYmnrx7nRrt0';
  static const String _baseUrl = 'https://api.pexels.com/v1';

  static Future<List<String>> fetchImages(String query, int count) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/search?query=${Uri.encodeComponent(query)}&per_page=$count'),
      headers: {'Authorization': _apiKey},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final photos = data['photos'] as List;
      return photos.map((p) => p['src']['medium'] as String).toList();
    }
    return [];
  }
}
