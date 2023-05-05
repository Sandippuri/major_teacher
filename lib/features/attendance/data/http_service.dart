import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<http.Response> get(String url) async {
    final response = await http.get(Uri.parse(url), headers: {
      'Authorization':
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im5hbmR1LnlhZGF2QGRhbXB1cy5lZHUubnAiLCJyb2xlIjoiVEVBQ0hFUiIsInN0dWRlbnRJZCI6LTEsInRlYWNoZXJJZCI6IjY2NThmODIxLWY5YzAtNDczYy1iNGFiLTVlOWQwZGQ5NzllMyIsImlhdCI6MTY3ODE3Mjg3MH0.0FdIR-rpYuTXRpwHo3TnEbUQnaXAxfqFg2n7VpKtaCI'
    });
    return response;
  }

  static Future<http.Response> post(
      String url, Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Im5hbmR1LnlhZGF2QGRhbXB1cy5lZHUubnAiLCJyb2xlIjoiVEVBQ0hFUiIsInN0dWRlbnRJZCI6LTEsInRlYWNoZXJJZCI6IjY2NThmODIxLWY5YzAtNDczYy1iNGFiLTVlOWQwZGQ5NzllMyIsImlhdCI6MTY3ODE3Mjg3MH0.0FdIR-rpYuTXRpwHo3TnEbUQnaXAxfqFg2n7VpKtaCI'
      },
      body: jsonEncode(data),
    );
    return response;
  }
}
