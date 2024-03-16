part of 'apiblocker_bloc.dart';

@immutable
sealed class ApiblockerState {}

final class ApiblockerInitial extends ApiblockerState {}

final class ApiLoadedState extends ApiblockerState {
  final List<Map<String, dynamic>> filteredApis;
  ApiLoadedState(this.filteredApis);
}

final class ApiLoadingState extends ApiblockerState {}

final class ApiDataLoadedState extends ApiblockerState {
  final List<todoApiModel> apiData;
  ApiDataLoadedState(this.apiData);
}
