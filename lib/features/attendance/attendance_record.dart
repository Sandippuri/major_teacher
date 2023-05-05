import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:major_app_teacher/features/attendance/controller/attendance_controller.dart';

class AttendanceRecord extends StatefulWidget {
  final String? lectureId;

  AttendanceRecord({this.lectureId, super.key});

  @override
  State<AttendanceRecord> createState() => _AttendanceRecordState();
}

class _AttendanceRecordState extends State<AttendanceRecord> {
  final ApiController _apiController = Get.put(ApiController());

  @override
  void initState() {
    super.initState();
    print(widget.lectureId);
    _apiController.fetchAttendanceRecordbyLectureId(widget.lectureId);
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
          "Attendance Record",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Obx(
          () {
            if (_apiController.isRecordsLoading.isTrue) {
              return const Center(child: CircularProgressIndicator());
            } else if (_apiController.attendanceRecords.isEmpty) {
              return const Center(child: Text("No Records Found !"));
            } else {
              return ListView.builder(
                itemCount: _apiController.attendanceRecords.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    return Card(
                      child: ListTile(
                        title: Text(
                          (_apiController
                                  .attendanceRecords[index].student?.rollNumber)
                              .toString(),
                          style: TextStyle(
                              color: Color(0xff0097B2),
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          (_apiController
                                  .attendanceRecords[index].student?.name)
                              .toString(),
                          style: const TextStyle(
                              color: Colors.black54, fontSize: 18),
                        ),
                        trailing: Icon(
                            _apiController.attendanceRecords[index].present ??
                                    false
                                ? (Icons.check_circle)
                                : Icons.cancel,
                            color: _apiController
                                        .attendanceRecords[index].present ??
                                    false
                                ? Colors.green
                                : Colors.red),
                        // leading: _apiController.attendanceRecords[index].present !== null?
                        // onTap: () {
                        //   if (isSelected) {
                        //     _apiController.selectedStudents.remove(studentId);
                        //   } else {
                        //     _apiController.selectedStudents.add(studentId);
                        //   }
                        // },
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
