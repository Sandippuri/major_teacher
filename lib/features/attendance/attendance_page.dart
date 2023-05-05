import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:major_app_teacher/features/attendance/controller/attendance_controller.dart';

class AttendancePage extends StatefulWidget {
  final String? lectureId;
  final String? sectionId;

  AttendancePage({this.lectureId, this.sectionId, super.key});

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final ApiController _apiController = Get.put(ApiController());

  @override
  void initState() {
    super.initState();
    _apiController.fetchStudent(_apiController.sectionId);
  }

  void submitAttendance(context) async {
    final response = await _apiController.postAttendance(
        widget.lectureId, _apiController.selectedStudents);
    try {
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Attendance Saved",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff23353F),
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pop(context);
        _apiController.selectedStudents.clear();
      }
    } catch (err) {
      Fluttertoast.showToast(
          msg: jsonDecode(response.body)['error'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff23353F),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.lectureId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          DateFormat.yMMMEd().format(DateTime.parse(DateTime.now().toString())),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.check,
              color: Colors.black,
            ),
            onPressed: () => submitAttendance(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Obx(
          () {
            if (_apiController.isStudentsLoading.isTrue) {
              return Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff0097B2))));
            } else {
              return ListView.builder(
                itemCount: _apiController.students.length,
                itemBuilder: (context, index) {
                  int studentId =
                      int.parse(_apiController.students[index].id.toString());
                  return Obx(() {
                    bool isSelected =
                        _apiController.selectedStudents.contains(studentId);
                    return Card(
                      child: ListTile(
                        title: Text(
                            _apiController.students[index].rollNumber
                                .toString(),
                            style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff0097B2),
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(
                            _apiController.students[index].name.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                                fontWeight: FontWeight.normal)),
                        trailing: isSelected
                            ? const Icon(Icons.check_box)
                            : const Icon(Icons.check_box_outline_blank),
                        onTap: () {
                          if (isSelected) {
                            _apiController.selectedStudents.remove(studentId);
                          } else {
                            _apiController.selectedStudents.add(studentId);
                          }
                        },
                      ),
                    );
                  });
                },
              );
            }
          },
        ),
        // child: Obx(() => _apiController.students.isEmpty
        //     ? const Center(child: CircularProgressIndicator())
        //     : ListView.builder(
        //         itemCount: _apiController.students.length,
        //         itemBuilder: (context, index) {
        //           return Card(
        //               child: Padding(
        //             padding: const EdgeInsets.all(10.0),
        //             child: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //               children: [
        //                 Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       _apiController.students[index].name.toString(),
        //                       style: const TextStyle(
        //                           fontSize: 16,
        //                           color: Colors.grey,
        //                           fontWeight: FontWeight.bold),
        //                     ),
        //                     const SizedBox(
        //                       height: 6,
        //                     ),
        //                     Text(
        //                       _apiController.students[index].name.toString(),
        //                       style: const TextStyle(
        //                         color: Colors.black,
        //                         fontSize: 18,
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //               ],
        //             ),
        //           ));
        //         },
        //       )),
        // child: Column(
        //   children: [
        // Card(
        //     child: Padding(
        //   padding: const EdgeInsets.all(10.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Row(
        //         children: [
        //           const CircleAvatar(
        //               // backgroundImage: AssetImage(
        //               //     "assets/images/Googlelogo.jpg"), // No matter how big it is, it won't overflow
        //               ),
        //           const SizedBox(
        //             width: 10,
        //           ),
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: const [
        //               Text(
        //                 '075BCT-056',
        //                 style: TextStyle(
        //                     fontSize: 16,
        //                     color: Colors.grey,
        //                     fontWeight: FontWeight.bold),
        //               ),
        //               SizedBox(
        //                 height: 6,
        //               ),
        //               Text(
        //                 'Nisha Sharma',
        //                 style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 18,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // )),
        //   ],
        // ),
      ),
    );
  }
}
