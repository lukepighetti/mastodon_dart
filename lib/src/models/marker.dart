//todo: do this with json_serializable; currently using json2dart
//todo: implement mock

import 'package:json_annotation/json_annotation.dart';

part 'marker.g.dart';

/// Represents the last read position within a user's timelines.
/// https://docs.joinmastodon.org/entities/marker/
@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Marker {
  /// Information about the user's position in the home timeline
  final Position? home;

  /// Information about the user's position in their notifications
  final Position? notifications;

  Marker({
    required this.home,
    required this.notifications,
  });

  factory Marker.fromJson(Map<String, dynamic> json) => _$MarkerFromJson(json);

  Map<String, dynamic> toJson() => _$MarkerToJson(this);

  @override
  String toString() => "Marker("
      "$home, "
      "$notifications"
      ")";
}

/// Timeline position information
@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Position {
  /// The ID of the most recently viewed entity
  final String? lastReadId;

  /// The timestamp of when the marker was set
  final String? updatedAt;

  /// Used for locking to prevent write conflicts
  final int? version;

  Position({
    required this.lastReadId,
    required this.version,
    required this.updatedAt,
  });

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);

  Map<String, dynamic> toJson() => _$PositionToJson(this);

  @override
  String toString() => "Position("
      "$lastReadId, "
      "$updatedAt, "
      "$version"
      ")";
}
