import '../authentication.dart';
import '../models/notification.dart';
import '../response.dart';
import '../result.dart';
import '../utilities.dart';

typedef NotificationsResponse = Response<List<Result<Notification>>>;
typedef NotificationResponse = Response<Result<Notification>>;

mixin Notifications on Authentication, Utilities {
  /// GET /api/v1/notifications
  ///
  /// - authentication (requires user)
  /// - read read:notifications
  Future<NotificationsResponse> notifications({
    String? maxId,
    String? sinceId,
    String? minId,
    int limit = 20,
    List<NotificationType>? excludeTypes,
    String? accountId,
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
        "account_id": accountId,
      }..removeWhere((_, value) => value == null),
    );

    return Response.fromList(response.body, Notification.fromJson);
  }

  /// GET /api/v1/notifications/:id
  ///
  /// - authentication (requires user)
  /// - read read:notifications
  Future<NotificationResponse> notification(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/notifications/$id",
      authenticated: true,
    );

    return Response.from(response.body, Notification.fromJson);
  }

  /// POST /api/v1/notifications/clear
  ///
  /// - authentication (requires user)
  /// - write write:notifications
  Future<void> clearNotifications() async {
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
  Future<void> dismissNotification(String id) async {
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
