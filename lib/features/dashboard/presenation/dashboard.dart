import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../events/view/event_page.dart';
import '../../notice/controller/notice_controller.dart';
import '../../notice/view/notice_page.dart';
import '../../profile/teacher_homepage.dart';
import '../controller/dashboard_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        body: SafeArea(
          child: IndexedStack(
            index: controller.selectedIndex,
            children: [
              TeacherHomePage(),
              const NoticePage(),
              const EventPage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xff0097B2),
          unselectedItemColor: Color(0xff23353F),
          showUnselectedLabels: false,
          onTap: controller.changeIndex,
          selectedFontSize: 12,
          currentIndex: controller.selectedIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              // label: 'Home',
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notice',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'Events',
            ),
          ],
        ),
      );
    });
  }
}
