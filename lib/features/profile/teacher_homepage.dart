import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:major_app_teacher/features/loginpage/controller/login_controller.dart';
import 'package:major_app_teacher/features/profile/teacherprofile_page.dart';

class TeacherHomePage extends StatelessWidget {
  TeacherHomePage({super.key});
  final LoginController loginController = Get.put(LoginController());

  void logoutHandler() {
    print('loggedout');
    loginController.logout();
    Fluttertoast.showToast(
        msg: "Logged Out Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Color(0xff23353F),
        textColor: Colors.white,
        fontSize: 16.0);
    Get.toNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Color(0xff23353F),
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
                          const CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.white,
                            // backgroundImage: AssetImage('assets/images/1.jpg'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome !',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xff0097B2),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  loginController.teacherName.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                              icon: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, "/notice");
                              }),
                          IconButton(
                              icon: const Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              onPressed: logoutHandler),
                        ],
                      ),
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
                        Text(
                          'Our Features',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0097B2),
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
                                        color: Color(0xff23353F),
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
                        // Text(
                        //   'More Features',
                        //   style: TextStyle(
                        //     fontSize: 14,
                        //     fontWeight: FontWeight.bold,
                        //     color: Color(0xff0097B2),
                        //   ),
                        // ),
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
];

class OtherFeatures {
  final String name;
  final IconData icon;
  final String navigate;
  const OtherFeatures(
      {required this.name, required this.icon, required this.navigate});
}

final List<OtherFeatures> otherFeaturesList = [
  // const OtherFeatures(
  //     name: "Syllabus", icon: Icons.book_outlined, navigate: '/syllabus'),
];
