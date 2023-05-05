import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'attendance_page.dart';
import 'controller/attendance_controller.dart';

class LectureListPage extends StatefulWidget {
  String? courseId;
  String? courseName;
  LectureListPage({this.courseId, this.courseName, super.key});

  @override
  State<LectureListPage> createState() => _LectureListPageState();
}

class _LectureListPageState extends State<LectureListPage> {
  final _apiController = Get.put(ApiController());
  late var _currentLectureId;

  @override
  void initState() {
    super.initState();
    _apiController.fetchLecturesbyId(widget.courseId);
    _apiController.fetchAggregateRecordbyCourseId(widget.courseId);
  }

  void _submitData(context, courseId) async {
    final response = await _apiController.submitLectureData(courseId);
    _currentLectureId = jsonDecode(response.body)['value']['id'].toString();

    try {
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Lecture Created Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff23353F),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (err) {
      Fluttertoast.showToast(
          msg: jsonDecode(response.body)['error'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[500],
          textColor: Colors.white,
          fontSize: 16.0);
      print(err);
    } finally {
      Navigator.pushNamed(context, '/attendance_page',
          arguments: _currentLectureId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            indicatorColor: Color(0xff0097B2),
            tabs: [
              Tab(
                  child: Text(
                "Lecture List",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              )),
              Tab(
                  child: Text(
                "Records",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              )),
            ],
          ),
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
          actions: [
            IconButton(
              onPressed: () {
                _submitData(context, widget.courseId);
              },
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Obx(
                  () {
                    if (_apiController.isLecturesLoading.value) {
                      return const Center(
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff0097B2))));
                    } else if (_apiController.lectures.isEmpty) {
                      return const Center(
                          child: Text(
                        "No Lectures Found",
                        style: TextStyle(color: Colors.black38),
                      ));
                    } else {
                      return ListView.builder(
                        itemCount: _apiController.lectures.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/attendance_record',
                                  arguments: _apiController.lectures[index].id
                                      .toString());
                            },
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        DateFormat.yMMMEd()
                                            .format(DateTime.parse(
                                                _apiController
                                                    .lectures[index].date
                                                    .toString()))
                                            .toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: const [
                                          Text(
                                            'Present: 42',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Absent: 6',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                          );
                        },
                      );
                    }
                  },
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Obx(() {
                  if (_apiController.isAggregateRecordsLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (_apiController.attendanceDetails.isEmpty) {
                    return const Center(child: Text("No Records Found"));
                  } else {
                    return ListView.builder(
                        itemCount: _apiController.attendanceDetails.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (_apiController
                                                  .attendanceDetails[index]
                                                  .rollNumber)
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
                                          (_apiController
                                                  .attendanceDetails[index]
                                                  .name)
                                              .toString(),
                                          style: const TextStyle(
                                            color: Colors.black54,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          _apiController
                                              .attendanceDetails[index]
                                              .presentDays
                                              .toString(),
                                          style: TextStyle(
                                            color: Color(0xff0097B2),
                                            fontSize: 24,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Text(
                                          "/${_apiController.totalLectures}",
                                          style: TextStyle(
                                            color: Colors.grey[400],
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ));
                        });
                  }
                })),
          ],
        ),
      ),
    );
  }
}
