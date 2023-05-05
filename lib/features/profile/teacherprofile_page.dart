import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_app_teacher/features/loginpage/controller/login_controller.dart';

class TeacherProfilePage extends StatefulWidget {
  TeacherProfilePage({super.key});

  @override
  State<TeacherProfilePage> createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  final LoginController loginController = Get.put(LoginController());

  void logoutHandler() {
    print('loggedout');
    loginController.logout();
    Get.snackbar("Success", "Logout Successful",
        icon: const Icon(
          Icons.done,
          color: Colors.white,
          size: 32,
        ),
        duration: const Duration(milliseconds: 1200),
        backgroundColor: Colors.green,
        colorText: Colors.white);
    Get.toNamed("/");
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * 0.54,
            child: Stack(children: [
              Container(
                // height: 20,
                height: size.height * 0.51 - 20,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 12, right: 12),
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircleAvatar(
                              radius: 100,
                              // backgroundImage: AssetImage('assets/images/1.jpg'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text("Aman Shakya ",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Card(
                    // backgroundColor: CustomTheme.primary,
                    color: Color(0xff23353F),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Assistant Professor',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'DOECE',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Pulchowk Campus',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'IOE',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: ElevatedButton(
              onPressed: logoutHandler,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff23353F), // background
              ),
              child: const Text('Log Out'),
            ),
          )
        ],
      ),
    );
  }
}
