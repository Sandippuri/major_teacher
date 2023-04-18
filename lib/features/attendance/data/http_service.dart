import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static final String baseUrl = 'http://campus.timalsinasagar.com.np';

  static Future<http.Response> get(String endpoint) async {
    final response = await http.get(Uri.parse(baseUrl + endpoint));
    return response;
  }

  static Future<http.Response> post(
      String endpoint, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(baseUrl + endpoint),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return response;
  }
}
