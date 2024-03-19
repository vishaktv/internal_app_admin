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
      emit(ApiLoading());
      DateTime toDate = DateTime.now();
      DateTime fromDate = toDate.subtract(const Duration(days: 7));
      String formattedFromDate =
          "${fromDate.year}-${formatNumber(fromDate.month)}-${formatNumber(fromDate.day)}";
      String formattedToDate =
          "${toDate.year}-${formatNumber(toDate.month)}-${formatNumber(toDate.day)}";
      final OnboardingStatisticsReq date =
          OnboardingStatisticsReq(formattedFromDate, formattedToDate);
      try {
        final Response<APIModel<OnboardingStatisticsRes>> response =
            await apiRepository.onboardingStatistics(date);
        if (response.statusCode == 200 &&
            response.data != null &&
            response.data?.response != null) {
          final APIModel<OnboardingStatisticsRes> res =
              response.data as APIModel<OnboardingStatisticsRes>;
          emit(ApiFullFilled(res.response));
        }
      } on DioException catch (e) {
        emit(ApiRejected(e));
      }
    });
  }

  String formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }
}
