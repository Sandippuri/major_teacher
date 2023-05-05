import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_app_teacher/features/attendance/model/aggregate.dart';
import 'package:major_app_teacher/features/attendance/model/attendance_record.dart';
import 'package:major_app_teacher/features/attendance/model/course.dart';
import 'package:major_app_teacher/features/attendance/model/lecture.dart';
import 'package:major_app_teacher/features/attendance/model/section.dart';
import 'package:major_app_teacher/features/loginpage/controller/login_controller.dart';
import 'package:http/http.dart' as http;
import '../model/college.dart';
import '../model/subject.dart';

class ApiController extends GetxController {
  final LoginController loginController = Get.put(LoginController());

  var sectionId = 0;
  var totalLectures = 0;
  var isLecturesLoading = true.obs;
  var isCoursesLoading = true.obs;
  var isStudentsLoading = true.obs;
  var isRecordsLoading = true.obs;
  var isAggregateRecordsLoading = true.obs;
  var selectedStudents = <int>[].obs;
  // Rx courseData = <Course>{}.obs;
  RxList<Student> students = <Student>[].obs;
  RxList<College> colleges = <College>[].obs;
  RxList<Section> sections = <Section>[].obs;
  RxList<Subject> subjects = <Subject>[].obs;
  RxList<Course> courses = <Course>[].obs;
  RxList<Lecture> lectures = <Lecture>[].obs;
  RxList<AttendanceRecord> attendanceRecords = <AttendanceRecord>[].obs;
  RxList<AttendanceDetails> attendanceDetails = <AttendanceDetails>[].obs;

  @override
  void onInit() {
    fetchCollege();
    fetchSection();
    fetchSubject();
    fetchCourses();
    super.onInit();
  }

  Future<void> fetchCollege() async {
    final response = await http.get(
        Uri.parse('http://campus.timalsinasagar.com.np/campus'),
        headers: {'Authorization': loginController.token.value});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["value"];

      final List<College> collegeList =
          List<College>.from(data.map((x) => College.fromJson(x)));
      colleges.assignAll(collegeList);
    }
  }

  Future<void> fetchStudent(id) async {
    try {
      isStudentsLoading.value = true;
      final response = await http.get(
          Uri.parse('http://student.timalsinasagar.com.np/sections/$id'),
          headers: {'Authorization': loginController.token.value});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["value"]["Students"];

        final List<Student> studentList =
            List<Student>.from(data.map((x) => Student.fromJson(x)));
        students.assignAll(studentList);
        print(studentList);
      }
    } finally {
      isStudentsLoading.value = false;
    }
  }

  Future<void> fetchSection() async {
    final response = await http.get(
        Uri.parse('http://student.timalsinasagar.com.np/sections'),
        headers: {'Authorization': loginController.token.value});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["value"];

      final List<Section> sectionList =
          List<Section>.from(data.map((x) => Section.fromJson(x)));
      sections.assignAll(sectionList);
    }
  }

  Future<void> fetchSubject() async {
    final response = await http.get(
        Uri.parse('http://curriculum.timalsinasagar.com.np/subjects'),
        headers: {'Authorization': loginController.token.value});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["value"];

      final List<Subject> subjectList =
          List<Subject>.from(data.map((x) => Subject.fromJson(x)));
      subjects.assignAll(subjectList);
    }
  }

  Future<void> fetchCourses() async {
    try {
      isCoursesLoading.value = true;
      final response = await http.get(
          Uri.parse('http://attendence.timalsinasagar.com.np/courses'),
          headers: {'Authorization': loginController.token.value});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["value"];

        final List<Course> courseList =
            List<Course>.from(data.map((x) => Course.fromJson(x)));
        courses.assignAll(courseList);
      }
    } finally {
      isCoursesLoading.value = false;
    }
  }

  Future<void> fetchLecturesbyId(id) async {
    try {
      isLecturesLoading.value = true;
      final response = await http.get(
          Uri.parse(
              'http://attendence.timalsinasagar.com.np/lectures/course/$id'),
          headers: {'Authorization': loginController.token.value});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["value"];
        final sectionData = jsonDecode(response.body)["course"]["sectionId"];
        // print(jsonDecode(response.body)["course"]["sectionId"]);
        Get.find<ApiController>().sectionId = sectionData;

        List<Lecture> lectureList =
            List<Lecture>.from(data.map((x) => Lecture.fromJson(x)));
        lectures.assignAll(lectureList);
      }
    } finally {
      isLecturesLoading.value = false;
    }
  }

  Future<void> fetchAttendanceRecordbyLectureId(id) async {
    try {
      isRecordsLoading.value = true;
      final response = await http.get(
          Uri.parse(
              'http://attendence.timalsinasagar.com.np/attendanceRecord/lecture/$id'),
          headers: {'Authorization': loginController.token.value});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["value"];
        // print(jsonDecode(response.body)["course"]["sectionId"]);

        List<AttendanceRecord> attendanceRecordList =
            List<AttendanceRecord>.from(
                data.map((x) => AttendanceRecord.fromJson(x)));
        attendanceRecords.assignAll(attendanceRecordList);
      }
    } finally {
      isRecordsLoading.value = false;
    }
  }

  Future<void> fetchAggregateRecordbyCourseId(id) async {
    try {
      isAggregateRecordsLoading.value = true;
      final response = await http.get(
          Uri.parse(
              'http://attendence.timalsinasagar.com.np/courses/aggregate/$id'),
          headers: {'Authorization': loginController.token.value});

      if (response.statusCode == 200) {
        Get.find<ApiController>().totalLectures =
            jsonDecode(response.body)["value"]["totalLectures"];
        final aggregateData =
            jsonDecode(response.body)["value"]["attendanceDetails"];
        // print(jsonDecode(response.body)["course"]["sectionId"]);

        List<AttendanceDetails> aggregateRecordList =
            List<AttendanceDetails>.from(
                aggregateData.map((x) => AttendanceDetails.fromJson(x)));
        attendanceDetails.assignAll(aggregateRecordList);
      }
    } finally {
      isAggregateRecordsLoading.value = false;
    }
  }

  Future<http.Response> submitCourseData(name, sectionId, subjectId) async {
    final data = {
      'name': name,
      'sectionId': sectionId,
      'subjectId': subjectId,
    };

    final response = await http.post(
      Uri.parse('http://attendence.timalsinasagar.com.np/courses/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': loginController.token.value
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final response = await http.get(
          Uri.parse('http://attendence.timalsinasagar.com.np/courses'),
          headers: {'Authorization': loginController.token.value});
      final data = jsonDecode(response.body)["value"];

      final List<Course> courseList =
          List<Course>.from(data.map((x) => Course.fromJson(x)));
      courses.assignAll(courseList);
    }
    return response;
  }

  Future<http.Response> submitLectureData(courseId) async {
    final data = {
      'date': DateTime.now().toString(),
      'courseId': courseId,
    };
    final response = await http.post(
      Uri.parse('http://attendence.timalsinasagar.com.np/lectures/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': loginController.token.value
      },
      body: jsonEncode(data),
    );

    return response;
  }

  Future<http.Response> postAttendance(lectureId, presentStudents) async {
    final data = {
      'lectureId': lectureId,
      'studentIds': presentStudents.toList(),
    };
    print(data);
    final response = await http.post(
      Uri.parse('http://attendence.timalsinasagar.com.np/attendanceRecord/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': loginController.token.value
      },
      body: jsonEncode(data),
    );

    return response;
  }
}
