import 'package:flutter/material.dart';

class TeacherAttendanceThirdPage extends StatefulWidget {
  const TeacherAttendanceThirdPage({super.key});

  @override
  State<TeacherAttendanceThirdPage> createState() =>
      TeacherAttendanceThirdPageState();
}

class TeacherAttendanceThirdPageState
    extends State<TeacherAttendanceThirdPage> {
  bool checkBoxValue = false;
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
        title: const Text(
          '17 March, Tuesday',
          style: TextStyle(
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
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Card(
                child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                          // backgroundImage: AssetImage(
                          //     "assets/images/Googlelogo.jpg"), // No matter how big it is, it won't overflow
                          ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            '075BCT-056',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Nisha Sharma',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Checkbox(
                      value: checkBoxValue,
                      onChanged: (boolvalue) {
                        setState(() {
                          checkBoxValue = true;
                        });
                      }),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
