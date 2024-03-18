// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OnboardingStatisticsRes {
  final int completed;
  final int failure;
  final String fromDate;
  final int inProgress;
  final String toDate;
  final int total;
  final int underReview;

  OnboardingStatisticsRes(
    this.completed,
    this.failure,
    this.fromDate,
    this.inProgress,
    this.toDate,
    this.total,
    this.underReview,
  );

  OnboardingStatisticsRes copyWith({
    int? completed,
    int? failure,
    String? fromDate,
    int? inProgress,
    String? toDate,
    int? total,
    int? underReview,
  }) {
    return OnboardingStatisticsRes(
      completed ?? this.completed,
      failure ?? this.failure,
      fromDate ?? this.fromDate,
      inProgress ?? this.inProgress,
      toDate ?? this.toDate,
      total ?? this.total,
      underReview ?? this.underReview,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'completed': completed,
      'failure': failure,
      'fromDate': fromDate,
      'inProgress': inProgress,
      'toDate': toDate,
      'total': total,
      'underReview': underReview,
    };
  }

  factory OnboardingStatisticsRes.fromMap(Map<String, dynamic> map) {
    return OnboardingStatisticsRes(
      map['completed'] as int,
      map['failure'] as int,
      map['fromDate'] as String,
      map['inProgress'] as int,
      map['toDate'] as String,
      map['total'] as int,
      map['underReview'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingStatisticsRes.fromJson(String source) =>
      OnboardingStatisticsRes.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OnboardingStatisticsRes(completed: $completed, failure: $failure, fromDate: $fromDate, inProgress: $inProgress, toDate: $toDate, total: $total, underReview: $underReview)';
  }

  @override
  bool operator ==(covariant OnboardingStatisticsRes other) {
    if (identical(this, other)) return true;

    return other.completed == completed &&
        other.failure == failure &&
        other.fromDate == fromDate &&
        other.inProgress == inProgress &&
        other.toDate == toDate &&
        other.total == total &&
        other.underReview == underReview;
  }

  @override
  int get hashCode {
    return completed.hashCode ^
        failure.hashCode ^
        fromDate.hashCode ^
        inProgress.hashCode ^
        toDate.hashCode ^
        total.hashCode ^
        underReview.hashCode;
  }
}

class OnboardingStatisticsReq {
  final String fromDate;
  final String toDate;

  OnboardingStatisticsReq(
    this.fromDate,
    this.toDate,
  );

  OnboardingStatisticsReq copyWith({
    String? fromDate,
    String? toDate,
  }) {
    return OnboardingStatisticsReq(
      fromDate ?? this.fromDate,
      toDate ?? this.toDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fromDate': fromDate,
      'toDate': toDate,
    };
  }

  factory OnboardingStatisticsReq.fromMap(Map<String, dynamic> map) {
    return OnboardingStatisticsReq(
      map['fromDate'] as String,
      map['toDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardingStatisticsReq.fromJson(String source) =>
      OnboardingStatisticsReq.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'OnboardingStatisticsReq(fromDate: $fromDate, toDate: $toDate)';

  @override
  bool operator ==(covariant OnboardingStatisticsReq other) {
    if (identical(this, other)) return true;

    return other.fromDate == fromDate && other.toDate == toDate;
  }

  @override
  int get hashCode => fromDate.hashCode ^ toDate.hashCode;
}
