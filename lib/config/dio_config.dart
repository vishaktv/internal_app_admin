import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppInterceptor {
  Dio dio = Dio();
  final storage = new FlutterSecureStorage();
  static String baseUrl = "https://rj-admin-dashboard-dev.cred-intg.net/radb";

  AppInterceptor() {
    dio.options =
        BaseOptions(contentType: 'application/json', baseUrl: baseUrl);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions requestOptions,
          RequestInterceptorHandler handler) async {
        String? token = await storage.read(key: "accToken");
        if (!requestOptions.uri.toString().contains("/authenticate") &&
            !requestOptions.uri.toString().contains("/refresh") &&
            token != null) {
          requestOptions.headers['Authorization'] = 'Bearer $token';
          requestOptions.headers['accept'] = 'application/json';
        }
        handler.next(requestOptions);
      },
      onError: (DioException err, ErrorInterceptorHandler handler) async {
        // Handle errors if needed
        String requestUrl = err.requestOptions.uri.toString();
        if (err.response?.statusCode == 401) {
          print("error vannu");
          if (requestUrl != "/authenticate" || requestUrl != "/refresh") {}
        }
        handler.next(err);
      },
    ));
  }
}
