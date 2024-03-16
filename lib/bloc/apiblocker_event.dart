part of 'apiblocker_bloc.dart';

@immutable
sealed class ApiblockerEvent {}

final class SearchApiEvent extends ApiblockerEvent {
  final String searchTerm;

  SearchApiEvent(this.searchTerm);
}

final class SearchRCAApiEvent extends ApiblockerEvent {
  final String searchTerm;
  SearchRCAApiEvent(this.searchTerm);
}

final class SearchRCIApiEvent extends ApiblockerEvent {
  final String searchTerm;
  SearchRCIApiEvent(this.searchTerm);
}

final class SearchRCSApiEvent extends ApiblockerEvent {
  final String searchTerm;
  SearchRCSApiEvent(this.searchTerm);
}

final class SearchPLAIDApiEvent extends ApiblockerEvent {
  final String searchTerm;
  SearchPLAIDApiEvent(this.searchTerm);
}

final class SearchPAYTRACEApiEvent extends ApiblockerEvent {
  final String searchTerm;
  SearchPAYTRACEApiEvent(this.searchTerm);
}

final class SearchI2CApiEvent extends ApiblockerEvent {
  final String searchTerm;
  SearchI2CApiEvent(this.searchTerm);
}

final class SearchFINXACTApiEvent extends ApiblockerEvent {
  final String searchTerm;
  SearchFINXACTApiEvent(this.searchTerm);
}

final class LoadRCAAPisEvent extends ApiblockerEvent {
  final String apiType;
  LoadRCAAPisEvent(this.apiType);
}

final class RCAApiCallOnPageLoad extends ApiblockerEvent {}
