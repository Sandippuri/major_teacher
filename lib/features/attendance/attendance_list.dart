import 'package:flutter/material.dart';
import 'attendance_page.dart';

class TeacherAttendanceDetailPage extends StatelessWidget {
  const TeacherAttendanceDetailPage({super.key});

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
          '075BCT-CD',
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
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TeacherAttendanceThirdPage(),
                ),
              ),
            },
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '16 March 2023, Wednesday',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: const [
                          Text(
                            'Present: 42',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Absent: 6',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: (() => {}),
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.grey,
                      )),
                ],
              ),
            )),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
