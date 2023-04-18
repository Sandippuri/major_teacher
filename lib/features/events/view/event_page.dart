import 'package:flutter/material.dart';

import 'event_detailPage.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: const Text('Events',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 1,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    // ignore: prefer_const_constructors
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/aadhar.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 12),
                    child: Column(
                      children: [
                        const Text(
                          'AADHAR 2079, the IOE POETRY CHAMP 4.0 is happening tomorrow.',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Friday, February 3, 2023",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const EventDetailPage(),
                                      transitionDuration:
                                          const Duration(microseconds: 3000),
                                      transitionsBuilder: (_, a, __, c) =>
                                          FadeTransition(opacity: a, child: c),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: const [
                                    Text("view more"),
                                    Icon(Icons.arrow_forward_ios, size: 14),
                                  ],
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                  // child: Row(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   // ignore: prefer_const_literals_to_create_immutables
                  //   children: [
                  //     const Text(
                  //       'Title of the Card',
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     const SizedBox(height: 10),
                  //     const Text(
                  //       'Some description for the card',
                  //       style: TextStyle(
                  //         fontSize: 14,
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
