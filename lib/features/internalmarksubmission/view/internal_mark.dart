import 'package:flutter/material.dart';
import 'package:major_app_teacher/features/internalmarksubmission/view/marks_submission_page.dart';

class TeacherInternalMarkPage extends StatelessWidget {
  const TeacherInternalMarkPage({super.key});

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
            onPressed: () {},
          ),
        ],
      ),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
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
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(children: [
                                    Card(
                                        child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const TeacherInternalMarkTwoPage()),
                                              );
                                            },
                                            child: ListTile(
                                                title: Text(
                                                  "DBMS",
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.blueGrey[800],
                                                  ),
                                                ),
                                                isThreeLine: true,
                                                trailing:
                                                    const Icon(Icons.more_vert),
                                                subtitle: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Text(
                                                        '2074',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        'BCT-CD',
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      )
                                                    ])))),
                                  ]),
                                ),
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
