import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  RxBool isLogged = false.obs;
  RxString token = ''.obs;
  RxString teacherName = ''.obs;
  RxInt teacherId = 0.obs;

  Future<http.Response> login(String username, String password) async {
    var url = Uri.parse('http://authentication.timalsinasagar.com.np/login');
    final body = jsonEncode({'username': username, 'password': password});
    final headers = {'Content-Type': 'application/json'};
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);

    if (response.statusCode == 200 &&
        jsonDecode(response.body)['role'] == "TEACHER") {
      // User is authenticated
      token.value = jsonDecode(response.body)['value'];
      teacherId.value = jsonDecode(response.body)['teacherId'];
      teacherName.value =
          jsonDecode(response.body)['teacher']['data']['data']['full_name'];
      print(token.value);
      print(teacherId.value);
      print(teacherName.value);
      isLogged.value = true;
      return response;
    } else {
      // Login failed
      isLogged.value = false;
      return response;
    }
  }

  void logout() {
    isLogged.value = false;
    token.value = '';
    teacherId.value = 0;
  }
}
