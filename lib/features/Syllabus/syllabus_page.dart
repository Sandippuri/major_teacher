import 'package:flutter/material.dart';

class SyllabusPage extends StatelessWidget {
  const SyllabusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Syllabus',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
            itemCount: syllabusList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(syllabusList[index].name),
                  trailing: const Icon(Icons.arrow_right),
                ),
              );
            }),
      ),
    );
  }
}

class SyllabusList {
  final String name;
  const SyllabusList({required this.name});
}

final List<SyllabusList> syllabusList = [
  const SyllabusList(name: "Aerospace Engineering"),
  const SyllabusList(name: "Agricultural Engineering"),
  const SyllabusList(name: "Architecture Engineering"),
  const SyllabusList(name: "Automobile Engineering"),
  const SyllabusList(name: "Civil Engineering"),
  const SyllabusList(name: "Computer Engineering"),
  const SyllabusList(name: "Electrical Engineering"),
  const SyllabusList(name: "Electronics & Computer Engineering"),
  const SyllabusList(name: "Geomatics Engineering"),
  const SyllabusList(name: "Industrial Engineering"),
  const SyllabusList(name: "Mechanical Engineering"),
];
