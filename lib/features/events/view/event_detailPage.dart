import 'package:flutter/material.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const Text(
              'AADHAR 2079, the IOE POETRY CHAMP 4.0 is happening tomorrow.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              'Friday, February 3, 2023',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              height: 300,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                image: const DecorationImage(
                  image: AssetImage('assets/images/aadhar.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "One of the most awaited events of AADHAR 2079, the IOE POETRY CHAMP 4.0 is happening tomorrow. Don't miss out on this chance to witness some of the best works of some of the best poets out there!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
