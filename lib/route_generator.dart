import 'package:flutter/material.dart';
import 'package:major_app_teacher/features/Syllabus/syllabus_page.dart';
import 'package:major_app_teacher/features/attendance/attendance_page.dart';
import 'package:major_app_teacher/features/attendance/lecture_list.dart';
import 'package:major_app_teacher/features/dashboard/presenation/dashboard.dart';
import 'package:major_app_teacher/features/internalmarksubmission/view/marks_submission_page.dart';
import 'package:major_app_teacher/features/profile/teacher_homepage.dart';
import 'package:major_app_teacher/splash_screen.dart';
import 'features/attendance/attendance_record.dart';
import 'features/attendance/create_course.dart';
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
        return MaterialPageRoute(builder: (_) => TeacherHomePage());
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/notice':
        return MaterialPageRoute(builder: (_) => const NoticePage());
      case '/events':
        return MaterialPageRoute(builder: (_) => const EventPage());
      case '/event_details':
        return MaterialPageRoute(builder: (_) => const EventDetailPage());
      case '/syllabus':
        return MaterialPageRoute(builder: (_) => const SyllabusPage());
      case '/attendance':
        return MaterialPageRoute(builder: (_) => const CreateCourse());
      case '/attendance_page':
        var lectureId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => AttendancePage(
                  lectureId: lectureId,
                ));
      case '/attendance_record':
        var lectureId = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => AttendanceRecord(
                  lectureId: lectureId,
                ));
      case '/lectures':
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        final String courseId = arguments['courseId'];
        final String courseName = arguments['courseName'];
        return MaterialPageRoute(
            builder: (_) =>
                LectureListPage(courseId: courseId, courseName: courseName));
      case '/internal_marks':
        return MaterialPageRoute(
            builder: (_) => const CreateInternalMarksCourse());
      case '/marks_submission':
        final Map<String, dynamic> arguments =
            settings.arguments as Map<String, dynamic>;
        final String sectionId = arguments['sectionId'];
        final String courseId = arguments['courseId'];
        final String courseName = arguments['courseName'];
        return MaterialPageRoute(
            builder: (_) => MarksSubmission(
                sectionId: sectionId,
                courseId: courseId,
                courseName: courseName));
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
