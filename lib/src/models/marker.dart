//todo: do this with json_serializable; currently using json2dart
//todo: implement mock

/// Represents the last read position within a user's timelines.
/// https://docs.joinmastodon.org/entities/marker/
class Marker {
  /// Information about the user's position in the home timeline
  Position? home;

  /// Information about the user's position in their notifications
  Position? notifications;

  Marker({
    required this.home,
    required this.notifications,
  });

  Marker.fromJson(Map<String, dynamic> json) {
    home = json['home'] != null ? Position.fromJson(json['home']) : null;
    notifications = json['notifications'] != null
        ? Position.fromJson(json['notifications'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (home != null) {
      data['home'] = home!.toJson();
    }
    if (notifications != null) {
      data['notifications'] = notifications!.toJson();
    }
    return data;
  }
}

/// Timeline position information
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

  Position.fromJson(Map<String, dynamic> json) {
    lastReadId = json['last_read_id'];
    version = json['version'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['last_read_id'] = lastReadId;
    data['version'] = version;
    data['updated_at'] = updatedAt;
    return data;
  }
}
