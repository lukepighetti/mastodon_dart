import 'package:json_annotation/json_annotation.dart';
import 'package:mastodon_dart/src/mock/properties.dart';

part 'activity.g.dart';

/// Represents a weekly bucket of instance activity.
/// https://docs.joinmastodon.org/entities/activity/

@JsonSerializable(
  nullable: false,
  createToJson: false,
  fieldRename: FieldRename.snake,
)
class Activity {
  final DateTime week;
  final int statuses;
  final int logins;
  final int registrations;

  Activity({
    this.week,
    this.statuses,
    this.logins,
    this.registrations,
  });

  Activity.mock()
      : week = MockProperties.pastDate,
        statuses = MockProperties.integer,
        logins = MockProperties.integer,
        registrations = MockProperties.integer;

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
}
