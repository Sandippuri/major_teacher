import 'package:get/get.dart';
import '../data/notice_api.dart';
import '../model/notice_model.dart';

// final Map<String, List<dynamic>> data = {
//   "form": [
//     {"name": "Prayash"},
//     {"name": "Sandip"},
//   ]
// };

class NoticeController extends GetxController {
  final NoticeApiService _noticeApiService = NoticeApiService();
  var isLoading = true.obs;
  var dataList = <Notice>[].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    print("fetchData called");
    try {
      isLoading(true);
      final data = await _noticeApiService.fetchData();
      dataList.value = data;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
