import 'package:dio/dio.dart';

import '../model/notice_model.dart';

class NoticeApiService {
  final Dio _dio = Dio();

  Future<List<Notice>> fetchData() async {
    try {
      final response =
          await _dio.get('http://campus.timalsinasagar.com.np/notice');
      final result = List<Notice>.from(response.data["value"]
          .map((notices) => Notice.fromJson(notices))
          .toList());
      return result;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
