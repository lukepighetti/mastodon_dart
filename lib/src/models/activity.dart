import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

/// Represents a weekly bucket of instance activity.
/// https://docs.joinmastodon.org/entities/activity/

@JsonSerializable()
class Activity {
  /// Midnight at the first day of the week
  final DateTime week;

  /// Statuses created since the week began
  final int statuses;

  /// User logins since the week began
  final int logins;

  /// User registrations since the week began
  final int registrations;

  Activity({
    required this.week,
    required this.statuses,
    required this.logins,
    required this.registrations,
  });

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
