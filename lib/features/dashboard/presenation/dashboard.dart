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
            children: const [
              TeacherHomePage(),
              NoticePage(),
              EventPage(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(255, 79, 181, 212),
          unselectedItemColor: Colors.blueGrey[800],
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
