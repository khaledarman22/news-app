import 'package:dio/dio.dart';
import 'package:news/constants/strings.dart';

class DioHelper{

    late Dio  dio;
  DioHelper(){
    BaseOptions baseOptions=BaseOptions(
      baseUrl: MyStrings.baseurl,
    receiveTimeout: 15*1000,
    sendTimeout: 15*1000,
    receiveDataWhenStatusError: true,
    );
    dio=Dio(baseOptions);
  }

   Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async
  {
    dio.options.headers =
    {
      'Content-Type': 'application/json',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

}
