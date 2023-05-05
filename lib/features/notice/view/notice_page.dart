import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
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
        if (noticeController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff0097B2))),
          );
        } else if (noticeController.dataList.isEmpty) {
          return const Center(
            child: Text("No notices found"),
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
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          DateFormat.yMMMEd().format(
                              DateTime.parse(data.createdAt.toString())),
                          style:
                              TextStyle(color: Color(0xff0097B2), fontSize: 14),
                        ),
                      ],
                    ),
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
