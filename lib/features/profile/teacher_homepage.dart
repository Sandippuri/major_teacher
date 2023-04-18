import 'package:flutter/material.dart';
import 'package:major_app_teacher/features/profile/teacherprofile_page.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigate to the new page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TeacherProfilePage()
                                    //TeacherProfilePage()

                                    ),
                              );
                            },
                            child: const CircleAvatar(
                              radius: 25,
                              // backgroundImage: AssetImage('assets/images/1.jpg'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Welcome !',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Aman Shakya',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          icon: const Icon(Icons.notifications),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const InternalMarksSubmissionDetailsPage(),
                            //   ),
                            // );
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Our Features',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                            ),
                            itemCount: ourFeaturesList.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ourFeaturesList[index].navigate);
                                },
                                child: Card(
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(children: [
                                      Icon(
                                        ourFeaturesList[index].icon,
                                        color: Colors.blueGrey,
                                        size: 40,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        ourFeaturesList[index].name,
                                        style: const TextStyle(fontSize: 12),
                                      )
                                    ]),
                                  ),
                                ),
                              );
                            })),
                        const SizedBox(height: 20),
                        const Text(
                          'More Features',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              // childAspectRatio: 1.0,
                              // crossAxisSpacing: 0.0,
                              // mainAxisSpacing: 5,
                            ),
                            itemCount: otherFeaturesList.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context,
                                      otherFeaturesList[index].navigate);
                                },
                                child: Card(
                                  elevation: 0,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Column(children: [
                                      Icon(
                                        otherFeaturesList[index].icon,
                                        color: Colors.blueGrey,
                                        size: 40,
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        otherFeaturesList[index].name,
                                        style: const TextStyle(fontSize: 12),
                                      )
                                    ]),
                                  ),
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

class OurFeatures {
  final String name;
  final IconData icon;
  final String navigate;
  const OurFeatures(
      {required this.name, required this.icon, required this.navigate});
}

final List<OurFeatures> ourFeaturesList = [
  const OurFeatures(
      name: "Attendance",
      icon: Icons.assignment_outlined,
      navigate: '/attendance'),
  const OurFeatures(
      name: "Internal Marks",
      icon: Icons.book_outlined,
      navigate: '/internal_marks'),
  const OurFeatures(
      name: "Course", icon: Icons.golf_course, navigate: '/create_course'),
];

class OtherFeatures {
  final String name;
  final IconData icon;
  final String navigate;
  const OtherFeatures(
      {required this.name, required this.icon, required this.navigate});
}

final List<OtherFeatures> otherFeaturesList = [
  const OtherFeatures(
      name: "Syllabus", icon: Icons.book_outlined, navigate: '/syllabus'),
];
