import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:internal_app/model/onboarding_statatics.dart';
import 'package:internal_app/model/todoapimodel.dart';

import '../config/dio_config.dart';
import '../model/apimodel.dart';
import '../model/auth_api_model.dart';

class ApiRepository {
  final Dio _dio = Dio();
  final String baseUrl = "https://rj-admin-dashboard-dev.cred-intg.net/radb";
  AppInterceptor appInterceptor = AppInterceptor();
  ApiRepository() {
    // Configure Dio with a base URL
    _dio.options.baseUrl = baseUrl;
  }

  Future<List<todoApiModel>> fetchPosts() async {
    try {
      final response = await appInterceptor.dio.get("/todos");
      final List<dynamic> jsonList = response.data;
      final List<todoApiModel> data =
          jsonList.map((json) => todoApiModel.fromMap(json)).toList();
      return data;
    } catch (error) {
      // Handle errors
      print("Error: $error");
      throw error; // You might want to handle this error at a higher level
    }
  }

  Future<Response<APIModel<LoginResponse>>> login(
      AuthPayLoadModel credentials) async {
    final response = await appInterceptor.dio.post(
      "/general/authenticate",
      data: {
        "username": credentials.username,
        "password": credentials.password,
        "deviceType": credentials.deviceType,
        "deviceId": credentials.deviceId,
      },
    );
    final userData = response.data;
    APIModel<LoginResponse> responseData = APIModel<LoginResponse>.fromMap(
        userData, (map) => LoginResponse.fromMap(map));

    return Response(
        data: responseData,
        statusCode: response.statusCode,
        requestOptions: RequestOptions());
  }

  Future<Response<APIModel<OnboardingStatisticsRes>>> onboardingStatistics(
      OnboardingStatisticsReq date) async {
    final response = await appInterceptor.dio.post(
        "/general/getEnrollmentStatus",
        data: {"fromDate": date.fromDate, "toDate": date.toDate},
        options: Options(headers: {"purpose": "test "}));
    final userData = response.data;
    APIModel<OnboardingStatisticsRes> responseData =
        APIModel<OnboardingStatisticsRes>.fromMap(
            userData, (map) => OnboardingStatisticsRes.fromMap(map));
    print(userData);
    return Response(
        data: responseData,
        statusCode: response.statusCode,
        requestOptions: RequestOptions());
  }
}
