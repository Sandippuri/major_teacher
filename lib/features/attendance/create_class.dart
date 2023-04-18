import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'attendance_list.dart';
import 'controller/attendance_controller.dart';

// ignore: must_be_immutable
class TeacherAttendancePage extends StatefulWidget {
  const TeacherAttendancePage({super.key});

  @override
  State<TeacherAttendancePage> createState() => _TeacherAttendancePageState();
}

class _TeacherAttendancePageState extends State<TeacherAttendancePage> {
  final _apiController = Get.put(ApiController());

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await _apiController.fetchCollege();
    print(_apiController.colleges[0].name);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
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
        title: const Text(
          'Attendance',
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
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Add Class ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          const Text(
                            'Course Name',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding:
                                    EdgeInsets.only(left: 8, top: 4)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'College',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Container(
                            height: 50,
                            child: Obx(() => DropdownButton(
                                value: _apiController.dropdownbutton.value,
                                isExpanded: true,
                                hint: const Text("select your college"),
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: _apiController.colleges.map((college) {
                                  return DropdownMenuItem(
                                    value: college.iD,
                                    child: Text(college.name.toString()),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: _apiController.onDropdownChanged)),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            'Select Section',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          // Container(
                          //   height: 50,
                          //   child: DropdownButton(
                          //     isExpanded: true,
                          //     hint: Text("Select Section"),
                          //     value: dropdownvalue,

                          //     icon: const Icon(Icons.keyboard_arrow_down),

                          //     items: items.map((String items) {
                          //       return DropdownMenuItem(
                          //         value: items,
                          //         child: Text(
                          //           items,
                          //           style: TextStyle(fontSize: 16),
                          //         ),
                          //       );
                          //     }).toList(),
                          //     // After selecting the desired option,it will
                          //     // change button value to selected value
                          //     onChanged: (String? newValue) {
                          //       setState(() {
                          //         dropdownvalue = newValue!;
                          //       });
                          //     },
                          //   ),
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: () {
                                // Navigator.pushNamed(context, '/loginpage');
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.blueGrey[800], // background
                              ),
                              child: const Text('Create Class'),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey[800],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: 2,
                            itemBuilder: ((context, index) {
                              return Card(
                                elevation: 0,
                                child: Column(children: [
                                  Card(
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const TeacherAttendanceDetailPage()),
                                            );
                                          },
                                          child: ListTile(
                                              title: Text(
                                                "DBMS",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blueGrey[800],
                                                ),
                                              ),
                                              isThreeLine: true,
                                              trailing:
                                                  const Icon(Icons.more_vert),
                                              subtitle: const Text(
                                                  '2074 \nBCT-CD')))),
                                ]),
                              );
                            })),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
