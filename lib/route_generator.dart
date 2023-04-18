import 'package:flutter/material.dart';
import 'package:major_app_teacher/features/Syllabus/syllabus_page.dart';
import 'package:major_app_teacher/features/dashboard/presenation/dashboard.dart';
import 'features/attendance/create_class.dart';
import 'features/course/create_course_page.dart';
import 'features/events/view/event_detailPage.dart';
import 'features/events/view/event_page.dart';
import 'features/internalmarksubmission/view/internal_mark.dart';
import 'features/loginpage/views/login_page.dart';
import 'features/notice/view/notice_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //----------------Common Routes----------------
      case '/':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/notice':
        return MaterialPageRoute(builder: (_) => const NoticePage());
      case '/events':
        return MaterialPageRoute(builder: (_) => const EventPage());
      case '/event_details':
        return MaterialPageRoute(builder: (_) => const EventDetailPage());
      case '/create_course':
        return MaterialPageRoute(builder: (_) => const CreateCoursePage());
      case '/syllabus':
        return MaterialPageRoute(builder: (_) => const SyllabusPage());
      case '/attendance':
        return MaterialPageRoute(builder: (_) => const TeacherAttendancePage());
      case '/internal_marks':
        return MaterialPageRoute(
            builder: (_) => const TeacherInternalMarkPage());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
