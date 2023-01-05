import 'package:json_annotation/json_annotation.dart';

part 'marker.g.dart';

/// Represents the last read position within a user's timelines.
/// https://docs.joinmastodon.org/entities/Marker/

@JsonSerializable()
class Markers {
  /// Information about the user's position in the home timeline
  final Marker? home;

  /// Information about the user's position in their notifications
  final Marker? notifications;

  Markers({
    required this.home,
    required this.notifications,
  });

  factory Markers.fromJson(Map<String, dynamic> json) =>
      _$MarkersFromJson(json);
  Map<String, dynamic> toJson() => _$MarkersToJson(this);
}

/// Represents the last read position within a user's timelines
@JsonSerializable()
class Marker {
  /// The ID of the most recently viewed entity
  final String lastReadId;

  /// The timestamp of when the marker was set
  final DateTime updatedAt;

  /// An incrementing counter, used for locking to prevent write conflicts
  final int version;

  Marker({
    required this.lastReadId,
    required this.version,
    required this.updatedAt,
  });

  factory Marker.fromJson(Map<String, dynamic> json) => _$MarkerFromJson(json);
  Map<String, dynamic> toJson() => _$MarkerToJson(this);
}
