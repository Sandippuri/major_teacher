import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:major_app_teacher/features/internalmarksubmission/controller/internal_marks_controller.dart';
import 'package:major_app_teacher/features/internalmarksubmission/view/marks_submission_page.dart';

class CreateInternalMarksCourse extends StatefulWidget {
  const CreateInternalMarksCourse({super.key});

  @override
  State<CreateInternalMarksCourse> createState() =>
      _CreateInternalMarksCourseState();
}

class _CreateInternalMarksCourseState extends State<CreateInternalMarksCourse> {
  final internalMarksController = Get.put(InternalMarksController());
  final TextEditingController coursename = TextEditingController();
  final TextEditingController fullMarks = TextEditingController();
  final TextEditingController passMarks = TextEditingController();
  ValueNotifier<String?> sectiondropdownvalue = ValueNotifier<String?>(null);
  ValueNotifier<String?> subjectdropdownvalue = ValueNotifier<String?>(null);

  void _submitData() async {
    final response = await internalMarksController.submitCourseData(
        coursename.text,
        sectiondropdownvalue.value,
        subjectdropdownvalue.value,
        fullMarks.text,
        passMarks.text);

    try {
      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Course Created Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color(0xff23353F),
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pop(context);
      }
    } catch (err) {
      print(err);
      Fluttertoast.showToast(
          msg: err.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red[500],
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  void initState() {
    super.initState();

    if (internalMarksController.sections.isNotEmpty) {
      sectiondropdownvalue.value =
          internalMarksController.sections.first.id?.toString();
    }
    if (internalMarksController.subjects.isNotEmpty) {
      subjectdropdownvalue.value =
          internalMarksController.subjects.first.id?.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        //floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
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
          title: const Text(
            'Internal Marks Submission',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              color: Colors.black,
              onPressed: () => showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Container(
                      height: 550,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 12, right: 12),
                        child: ListView(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add Internal Marks Course ',
                              style: TextStyle(
                                color: Color(0xff23353F),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            const Text(
                              'Course Name',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: coursename,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.only(left: 8, top: 4)),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Select Section',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            Container(
                              height: 50,
                              child: ValueListenableBuilder(
                                  valueListenable: sectiondropdownvalue,
                                  builder: ((context, value, child) {
                                    return DropdownButton(
                                        value: value,
                                        isExpanded: true,
                                        hint: const Text("select your section"),
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items: internalMarksController.sections
                                            .map((section) {
                                          return DropdownMenuItem(
                                            value: section.id.toString(),
                                            child:
                                                Text(section.name.toString()),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (value) {
                                          print(value);
                                          sectiondropdownvalue.value =
                                              value.toString();
                                        });
                                  })),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Select Section',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            Container(
                              height: 50,
                              child: ValueListenableBuilder(
                                  valueListenable: subjectdropdownvalue,
                                  builder: ((context, value, child) {
                                    return DropdownButton(
                                        value: value,
                                        isExpanded: true,
                                        hint: const Text("select your subject"),
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items: internalMarksController.subjects
                                            .map((subject) {
                                          return DropdownMenuItem(
                                            value: subject.id.toString(),
                                            child: Text(
                                                subject.fullName.toString()),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (value) {
                                          print(value);
                                          subjectdropdownvalue.value =
                                              value.toString();
                                        });
                                  })),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Full Marks',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: fullMarks,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.only(left: 8, top: 4)),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            const Text(
                              'Pass Marks',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: passMarks,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.only(left: 8, top: 4)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: _submitData,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color(0xff23353F), // background
                                ),
                                child: const Text('Create Class'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: Obx(() {
          if (internalMarksController.isCoursesLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff0097B2))),
            );
          } else if (internalMarksController.courses.isEmpty) {
            return const Center(
              child: Text('No Courses'),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 4),
                  ),
                  itemCount: internalMarksController.courses.length,
                  // itemCount: 1,
                  itemBuilder: ((context, index) {
                    return Card(
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(children: [
                          Card(
                              elevation: 2.5,
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, "/marks_submission",
                                        arguments: {
                                          'sectionId': internalMarksController
                                              .courses[index].sectionId
                                              .toString(),
                                          'courseName': internalMarksController
                                              .courses[index].name
                                              .toString(),
                                          'courseId': internalMarksController
                                              .courses[index].id
                                              .toString(),
                                        });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          internalMarksController
                                              .courses[index].name
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff23353F),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(children: [
                                          Text(
                                            internalMarksController
                                                .courses[index].sectionName
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Color(0xff0097B2),
                                                fontWeight: FontWeight.normal),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            internalMarksController
                                                .courses[index].batch
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black54,
                                                fontWeight: FontWeight.normal),
                                          )
                                        ])
                                      ],
                                    ),
                                  ))),
                        ]),
                      ),
                    );
                  })),
            );
          }
        }));
  }
}
