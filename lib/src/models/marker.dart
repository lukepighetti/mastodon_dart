import 'package:json_annotation/json_annotation.dart';

part 'marker.g.dart';

/// Represents the last read position within a user's timelines.
/// https://docs.joinmastodon.org/entities/Marker/

@JsonSerializable()
class Marker {
  /// Information about the user's position in the home timeline
  Position? home;

  /// Information about the user's position in their notifications
  Position? notifications;

  Marker({
    required this.home,
    required this.notifications,
  });

  factory Marker.fromJson(Map<String, dynamic> json) => _$MarkerFromJson(json);
  Map<String, dynamic> toJson() => _$MarkerToJson(this);
}

/// Timeline position information
@JsonSerializable()
class Position {
  /// The ID of the most recently viewed entity
  String? lastReadId;

  /// The timestamp of when the marker was set
  String? updatedAt;

  /// Used for locking to prevent write conflicts
  int? version;

  Position({
    required this.lastReadId,
    required this.version,
    required this.updatedAt,
  });

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
  Map<String, dynamic> toJson() => _$PositionToJson(this);
}
