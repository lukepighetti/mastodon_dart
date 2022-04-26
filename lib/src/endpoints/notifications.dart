import '../library.dart';

mixin Notifications on Authentication, Utilities {
  /// GET /api/v1/notifications
  ///
  /// - authentication (requires user)
  /// - read read:notifications
  Future<List<Notification>> notifications({
    String? maxId,
    String? sinceId,
    String? minId,
    int limit = 20,
    List<NotificationType>? excludeTypes,
    String? account_id,
  }) async {
    final response = await request(
      Method.get,
      "/api/v1/notifications",
      authenticated: true,
      payload: {
        "max_id": maxId,
        "since_id": sinceId,
        "min_id": minId,
        "limit": limit.toString(),
        "exclude_types": excludeTypes?.map((e) => e.toString().split(".").last),
        "account_id": account_id,
      }..removeWhere((_, value) => value == null),
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination
    return body.map((m) => Notification.fromJson(m)).toList();
  }

  /// GET /api/v1/notifications/:id
  ///
  /// - authentication (requires user)
  /// - read read:notifications
  Future<Notification> notification(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/notifications/$id",
      authenticated: true,
    );

    return Notification.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/notifications/clear
  ///
  /// - authentication (requires user)
  /// - write write:notifications
  Future<dynamic> clearNotifications() async {
    await request(
      Method.post,
      "/api/v1/notifications/clear",
      authenticated: true,
    );
  }

  /// POST /api/v1/notifications/dismiss
  ///
  /// - authentication (requires user)
  /// - write write:notifications
  Future<dynamic> dismissNotification(String id) async {
    await request(
      Method.post,
      "/api/v1/notifications/dismiss",
      authenticated: true,
      payload: {
        "id": id,
      },
    );
  }
}
