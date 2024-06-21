import 'package:http/http.dart' as http;
import 'dart:convert';

class ColorsRepository {
  Future<Map<String, String>> fetchColors() async {
    final response = await http.get(Uri.parse('https://bachay.com/api/v1/colors_in_shop/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      return Map<String, String>.from(data['colors_in_shop']);
    } else {
      throw Exception('Failed to load colors');
    }
  }
}
