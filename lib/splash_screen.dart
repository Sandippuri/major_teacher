import 'package:flutter/material.dart';

import 'features/loginpage/views/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  bool _visible = true;
  @override
  void initState() {
    super.initState();
    _animate();
  }

  void _animate() async {
    // Add any code here that you want to execute before the animation starts
    await Future.delayed(Duration(milliseconds: 2000)); // Optional delay
    setState(() {
      _visible = false;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOut,
          child: Image.asset(
            'assets/images/splash.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
