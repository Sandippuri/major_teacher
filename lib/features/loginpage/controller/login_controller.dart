import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  RxBool isLogged = false.obs;
  RxString token = ''.obs;

  Future<bool> login(String username, String password) async {
    var url = Uri.parse('http://authentication.timalsinasagar.com.np/login');
    final body =
        jsonEncode({'username': 'student', 'password': 'studentstudent'});
    final headers = {'Content-Type': 'application/json'};
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);

    if (response.statusCode == 200) {
      // User is authenticated
      token.value = jsonDecode(response.body)['value'];
      isLogged.value = true;
      return true;
    } else {
      // Login failed
      isLogged.value = false;
      return false;
    }
  }

  void logout() {
    isLogged.value = false;
    token.value = '';
  }

  void setToken(String value) {
    token.value = value;
  }
}
