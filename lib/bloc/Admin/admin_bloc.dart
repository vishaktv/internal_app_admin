import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:internal_app/model/onboarding_statatics.dart';
import 'package:meta/meta.dart';

import '../../model/apimodel.dart';
import '../../repository/api.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final ApiRepository apiRepository = ApiRepository();
  AdminBloc() : super(AdminInitial()) {
    on<AdminOnbStataticsApiEvent>((event, emit) async {
      DateTime toDate = DateTime.now();
      DateTime fromDate = toDate.subtract(Duration(days: 7));

      // Format the dates to the specified format
      String formattedFromDate =
          "${fromDate.year}-${formatNumber(fromDate.month)}-${formatNumber(fromDate.day)}";
      String formattedToDate =
          "${toDate.year}-${formatNumber(toDate.month)}-${formatNumber(toDate.day)}";
      final OnboardingStatisticsReq date =
          OnboardingStatisticsReq(formattedFromDate, formattedToDate);
      final Response<APIModel<OnboardingStatisticsRes>> response =
          await apiRepository.onboardingStatistics(date);
      print(response);
    });
  }

  String formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }
}
