import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dioHelper;

  static init() {
    dioHelper = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData(
      {required String path, required Map<String, dynamic>? query}) async {
    return await dioHelper!.get(path, queryParameters: query);
  }
} //dioHelper
