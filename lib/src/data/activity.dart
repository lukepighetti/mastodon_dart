import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'activity.g.dart';

/// Represents a weekly bucket of instance activity.
/// https://docs.joinmastodon.org/entities/activity/

@JsonSerializable(
  createToJson: false,
  fieldRename: FieldRename.snake,
)
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

  Activity.mock()
      : week = MockProperties.pastDate,
        statuses = MockProperties.integer,
        logins = MockProperties.integer,
        registrations = MockProperties.integer;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
