import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/notice_controller.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    final noticeController = Get.put(NoticeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: const Text('Notices',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.black,
            ),
            onPressed: () => noticeController.fetchData(),
          ),
        ],
      ),
      body: Obx(() {
        if (noticeController.dataList.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.builder(
              itemCount: noticeController.dataList.length,
              itemBuilder: (context, index) {
                final data = noticeController.dataList[index];
                return Card(
                  child: ListTile(
                    title: Text(data.title.toString()),
                    subtitle: Text(data.createdAt.toString(),
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                );
              },
            ),
          );
        }
      }),
    );
  }
}
