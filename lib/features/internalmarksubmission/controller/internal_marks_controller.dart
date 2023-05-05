import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:major_app_teacher/features/internalmarksubmission/models/internal_marks_record.dart';
import 'package:major_app_teacher/features/loginpage/controller/login_controller.dart';

import '../models/college.dart';
import '../models/internal_marks_model.dart';
import '../models/section.dart';
import '../models/subject.dart';

class InternalMarksController extends GetxController {
  final LoginController loginController = Get.put(LoginController());
  var sectionId = 0;
  var isCoursesLoading = true.obs;
  var isMarksSubmitLoading = false.obs;
  var isStudentsLoading = true.obs;
  var isInternalMarksRecordsLoading = true.obs;
  RxList<InternalMarksCourse> courses = <InternalMarksCourse>[].obs;
  RxList<Subject> subjects = <Subject>[].obs;
  RxList<College> colleges = <College>[].obs;
  RxList<Section> sections = <Section>[].obs;
  RxList<Student> students = <Student>[].obs;
  RxList<MarksRecord> records = <MarksRecord>[].obs;

  @override
  void onInit() {
    fetchSubject();
    fetchCourses();
    fetchCollege();
    fetchSection();
    super.onInit();
  }

  Future<void> fetchCollege() async {
    final response = await http.get(
        Uri.parse("http://campus.timalsinasagar.com.np/campus"),
        headers: {'Authorization': loginController.token.value});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["value"];

      final List<College> collegeList =
          List<College>.from(data.map((x) => College.fromJson(x)));
      colleges.assignAll(collegeList);
    }
  }

  Future<void> fetchSubject() async {
    final response = await http.get(
        Uri.parse("http://curriculum.timalsinasagar.com.np/subjects"),
        headers: {'Authorization': loginController.token.value});
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["value"];

      final List<Subject> subjectList =
          List<Subject>.from(data.map((x) => Subject.fromJson(x)));
      subjects.assignAll(subjectList);
    }
  }

  Future<void> fetchSection() async {
    final response = await http.get(
        Uri.parse("http://student.timalsinasagar.com.np/sections"),
        headers: {'Authorization': loginController.token.value});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["value"];

      final List<Section> sectionList =
          List<Section>.from(data.map((x) => Section.fromJson(x)));
      sections.assignAll(sectionList);
    }
  }

  Future<void> fetchStudents(id) async {
    try {
      isStudentsLoading.value = true;
      final response = await http.get(
          Uri.parse("http://student.timalsinasagar.com.np/sections/$id"),
          headers: {'Authorization': loginController.token.value});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["value"]["Students"];

        final List<Student> studentList =
            List<Student>.from(data.map((x) => Student.fromJson(x)));
        students.assignAll(studentList);
      }
    } finally {
      isStudentsLoading.value = false;
    }
  }

  Future<void> fetchInternalMarksRecordsByCourseId(id) async {
    try {
      isInternalMarksRecordsLoading.value = true;
      final response = await http.get(
          Uri.parse(
              "http://internalmarks.timalsinasagar.com.np/markRecords/course/$id"),
          headers: {'Authorization': loginController.token.value});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["value"];
        print(data);

        final List<MarksRecord> recordsList =
            List<MarksRecord>.from(data.map((x) => MarksRecord.fromJson(x)));
        records.assignAll(recordsList);
      }
    } finally {
      isInternalMarksRecordsLoading.value = false;
    }
  }

  Future<void> fetchCourses() async {
    try {
      isCoursesLoading.value = true;
      final response = await http.get(
          Uri.parse("http://internalmarks.timalsinasagar.com.np/courses"),
          headers: {'Authorization': loginController.token.value});
      print(response.body);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["value"];

        final List<InternalMarksCourse> courseList =
            List<InternalMarksCourse>.from(
                data.map((x) => InternalMarksCourse.fromJson(x)));
        courses.assignAll(courseList);
      }
    } finally {
      isCoursesLoading.value = false;
    }
  }

  Future<http.Response> submitCourseData(
      name, sectionId, subjectId, fullMarks, passMarks) async {
    final data = {
      'name': name,
      'sectionId': sectionId,
      'subjectId': subjectId,
      'fullMarks': fullMarks,
      'passMarks': passMarks
    };

    final response = await http.post(
      Uri.parse('http://internalmarks.timalsinasagar.com.np/courses/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': loginController.token.value
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final response = await http.get(
          Uri.parse("http://internalmarks.timalsinasagar.com.np/courses"),
          headers: {'Authorization': loginController.token.value});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["value"];

        final List<InternalMarksCourse> courseList =
            List<InternalMarksCourse>.from(
                data.map((x) => InternalMarksCourse.fromJson(x)));
        courses.assignAll(courseList);
      }
    }
    return response;
  }

  Future<http.Response> submitMarksData(
      studentId, courseId, marksObtained) async {
    final data = {
      'studentId': studentId,
      'courseId': courseId,
      'marksObtained': marksObtained,
    };
    final response = await http.post(
      Uri.parse('http://internalmarks.timalsinasagar.com.np/markRecords/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': loginController.token.value
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final response = await http.get(
          Uri.parse(
              "http://internalmarks.timalsinasagar.com.np/markRecords/course/$courseId"),
          headers: {'Authorization': loginController.token.value});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["value"];
        final sec =
            jsonDecode(response.body)["value"][0]?["Student"]["sectionId"];
        print("section:$sec");

        final List<MarksRecord> recordsList =
            List<MarksRecord>.from(data.map((x) => MarksRecord.fromJson(x)));
        records.assignAll(recordsList);

        final studentResponse = await http.get(
            Uri.parse("http://student.timalsinasagar.com.np/sections/$sec"),
            headers: {'Authorization': loginController.token.value});

        if (studentResponse.statusCode == 200) {
          final studentData =
              jsonDecode(studentResponse.body)["value"]["Students"];

          final List<Student> studentList =
              List<Student>.from(studentData.map((x) => Student.fromJson(x)));
          students.assignAll(studentList);
        }
      }
    }

    return response;
  }
}
