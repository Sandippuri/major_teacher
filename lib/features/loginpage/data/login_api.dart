import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static const String _baseUrl =
      'http://authentication.timalsinasagar.com.np/login';

  static Future<http.Response> get(String endpoint,
      [Map<String, String>? headers]) async {
    final response =
        await http.get(Uri.parse('$_baseUrl$endpoint'), headers: headers);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw jsonDecode(response.body)['error'];
    }
  }

  static Future<http.Response> post(String endpoint, Map<String, dynamic> body,
      [Map<String, String>? headers]) async {
    final response = await http.post(
      Uri.parse('$_baseUrl$endpoint'),
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json', ...?headers},
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      throw jsonDecode(response.body)['error'];
    }
  }
}
