part of 'admin_bloc.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

final class ApiLoading extends AdminState {}

final class ApiFullFilled extends AdminState {}

final class ApiRejected extends AdminState {}
