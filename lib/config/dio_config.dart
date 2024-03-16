import 'package:dio/dio.dart';

class AppInterceptor {
  Dio dio = Dio();
  static String baseUrl = "https://rj-admin-dashboard-dev.cred-intg.net/radb";

  AppInterceptor() {
    dio.options =
        BaseOptions(contentType: 'application/json', baseUrl: baseUrl);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest:
          (RequestOptions requestOptions, RequestInterceptorHandler handler) {
        if (!requestOptions.uri.toString().contains("/authenticate") &&
            !requestOptions.uri.toString().contains("/refresh")) {
          requestOptions.headers['Authorization'] = 'Bearer ghjcyghfjhg';
        }
        handler.next(requestOptions);
      },
      onError: (DioException err, ErrorInterceptorHandler handler) async {
        // Handle errors if needed
        String requestUrl = err.requestOptions.uri.toString();
        if (err.response?.statusCode == 401) {
          print("error vannu");
          if (requestUrl != "/authenticate" || requestUrl != "/refersh") {}
        }
        handler.next(err);
      },
    ));
  }
}
