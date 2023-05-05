import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:major_app_teacher/features/loginpage/controller/login_controller.dart';

class TeacherController extends GetxController {
  final LoginController loginController = Get.put(LoginController());
  RxBool isLogged = false.obs;

  Future<void> fetchTeacherbyId(id) async {
    final response = await http.get(
        Uri.parse("http://student.timalsinasagar.com.np/sections/$id"),
        headers: {'Authorization': loginController.token.value});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["value"];
    }
  }
}
