import 'dart:convert';
import 'package:get/get.dart';
import '../data/http_service.dart';
import '../model/college.dart';

class ApiController extends GetxController {
  var dropdownbutton = 'Pulchowk Engineering Campus'.obs;
  void onDropdownChanged(newValue) {
    dropdownbutton.value = newValue;
  }

  RxList<College> colleges = <College>[].obs;

  @override
  void onInit() {
    fetchCollege();
    super.onInit();
  }

  Future<void> fetchCollege() async {
    final response = await HttpService.get('/campus');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["value"];

      final List<College> collegeList =
          List<College>.from(data.map((x) => College.fromJson(x)));
      colleges.assignAll(collegeList);
    }
  }
}
