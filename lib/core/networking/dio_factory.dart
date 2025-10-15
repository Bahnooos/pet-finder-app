import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();
  static Dio? dio;
  static Dio getDio() {
    Duration timeOut = Duration(seconds: 30);
    if (dio == null) {
      dio = Dio(BaseOptions(connectTimeout: timeOut, receiveTimeout: timeOut));
      addHeader();
      addInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addHeader() async {
    dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
  }

  static void sendTokenAfterLoggedIn(String? token) async {
    dio?.options.headers = {'Authorization': 'Bearer $token'};
  }

  static void addInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
