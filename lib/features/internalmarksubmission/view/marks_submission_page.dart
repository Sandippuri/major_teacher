import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_app_teacher/features/internalmarksubmission/controller/internal_marks_controller.dart';

class MarksSubmission extends StatefulWidget {
  String? sectionId;
  String? courseId;
  String? courseName;
  MarksSubmission({this.sectionId, this.courseId, this.courseName, super.key});

  @override
  State<MarksSubmission> createState() => _MarksSubmissionState();
}

class _MarksSubmissionState extends State<MarksSubmission> {
  final TextEditingController marksObtained = TextEditingController();
  final InternalMarksController internalMarksController =
      InternalMarksController();

  @override
  void initState() {
    super.initState();
    internalMarksController.fetchStudents(widget.sectionId);
    internalMarksController
        .fetchInternalMarksRecordsByCourseId(widget.courseId);
  }

  void _submitMarks(studentId) async {
    final response = await internalMarksController.submitMarksData(
        studentId, widget.courseId, marksObtained.text);

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Marks Submitted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff23353F),
          textColor: Colors.white,
          fontSize: 16.0);
      marksObtained.clear();
      Navigator.pop(context);
    } else {
      Fluttertoast.showToast(
          msg: jsonDecode(response.body)['error'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[500],
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
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
          widget.courseName.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Obx(() {
            if (internalMarksController.isStudentsLoading.value ||
                internalMarksController.isInternalMarksRecordsLoading.value) {
              return const Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xff0097B2))));
            } else {
              return ListView.builder(
                  itemCount: internalMarksController.students.length,
                  itemBuilder: (context, index) {
                    final studentId =
                        internalMarksController.students[index].id;
                    final matchedRecords = internalMarksController.records
                        .where((data) => data.studentId == studentId)
                        .toList();
                    return GestureDetector(
                      onTap: (() => matchedRecords.isEmpty
                          ? showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              isScrollControlled: true,
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Container(
                                    height: 250,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            internalMarksController
                                                .students[index].rollNumber
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.blue[300],
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            internalMarksController
                                                .students[index].name
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.02,
                                          ),
                                          const Text(
                                            'Marks Obtained',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextFormField(
                                            controller: marksObtained,
                                            autofocus: true,
                                            decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                contentPadding: EdgeInsets.only(
                                                    left: 8, top: 4)),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ElevatedButton(
                                              onPressed: () => _submitMarks(
                                                  internalMarksController
                                                      .students[index].id
                                                      .toString()),
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.blueGrey[
                                                        800], // background
                                              ),
                                              child: const Text('Submit'),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                          : Fluttertoast.showToast(
                              msg: "Marks Already Submitted",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red[500],
                              textColor: Colors.white,
                              fontSize: 16.0)),
                      child: Card(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  internalMarksController
                                      .students[index].rollNumber
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff0097B2),
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  internalMarksController.students[index].name
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            matchedRecords.isEmpty
                                ? const Text(
                                    "Tap to submit",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.normal),
                                  )
                                : Row(
                                    children: [
                                      Text(
                                        matchedRecords.every((element) =>
                                                element.marksObtained != null)
                                            ? matchedRecords.last.marksObtained
                                                .toString()
                                            : "",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: Color(0xff0097B2),
                                            fontWeight: FontWeight.normal),
                                      ),
                                      const Text(
                                        '/20',
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                            // Icon(Icons.check,
                            //     color: Color(0xff0097B2), size: 24),
                          ],
                        ),
                      )),
                    );
                  });
            }
          })),
    );
  }
}
