import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:major_app_teacher/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'IOE Teachers App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
