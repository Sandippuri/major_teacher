import 'package:get/get.dart';
import 'package:major_app_teacher/features/notice/controller/notice_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<NoticeController>(() => NoticeController());
  }
}
