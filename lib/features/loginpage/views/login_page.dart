import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = Get.put(LoginController());

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void _login() async {
    final username = emailController.text;
    final password = passwordController.text;

    print(username);
    print(password);

    bool isSuccess = await loginController.login(username, password);

    if (isSuccess) {
      Get.offAllNamed('/home');
    } else {
      // Show error message
      Get.snackbar(
        'Login Failed',
        'Invalid email or password',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.74,
            child: Stack(children: [
              Container(
                height: 300,
                //height: size.height * 0.54 - 20,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage('assets/images/welcome.png'),
                      fit: BoxFit.cover),
                  color: Colors.grey[350],
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                ),
              ),
              Positioned(
                // bottom: -100,
                // left: 0.5,
                // right: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Card(
                    // backgroundColor: CustomTheme.primary,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.grey)),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Welcome !',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[800],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Username',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  icon: const Icon(Icons.person),
                                  iconColor: Colors.blueGrey[800]),
                              cursorColor: Colors.blueGrey[800],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Password',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.grey,
                                )),
                            child: TextFormField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  icon: Icon(
                                    Icons.lock,
                                  )),
                              obscureText: true,
                              cursorColor: Colors.blueGrey[800],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                              onPressed: _login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.blueGrey[800], // background
                              ),
                              child: const Text('Login'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          // const Padding(padding: EdgeInsets.all(10)),
          // Center(
          //     child: Column(children: const [
          //   // ignore: unnecessary_new
          //   Text(
          //     " or ",
          //     style: TextStyle(
          //         color: Colors.black,
          //         fontSize: 20,
          //         fontWeight: FontWeight.normal),
          //   ),
          //   SizedBox(
          //     height: 10,
          //   ),
          //   Text(
          //     " Sign in using college mail ",
          //     style: TextStyle(color: Colors.grey),
          //   ),
          //   SizedBox(
          //     height: 10,
          //   ),
          // ])),

          // //const Padding(padding: EdgeInsets.all(10)),
          // Center(
          //     child: ClipRRect(
          //   borderRadius: BorderRadius.circular(50),
          //   child: Image.asset(
          //     'assets/images/Googlelogo.jpg',
          //     width: 50.0,
          //     height: 50.0,
          //     fit: BoxFit.cover,
          //   ),
          // ))
        ],
      ),
    );
  }
}
