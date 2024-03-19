part of 'admin_bloc.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

final class ApiLoading extends AdminState {}

final class ApiFullFilled extends AdminState {
  final OnboardingStatisticsRes onbRes;

  ApiFullFilled(this.onbRes);
}

final class ApiRejected extends AdminState {
  final DioException err;

  ApiRejected(this.err);
}
