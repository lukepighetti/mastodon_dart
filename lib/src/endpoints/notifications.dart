import '../library.dart';

import '../../mock/endpoints/notifications.dart';

mixin Notifications on Authentication, Utilities implements MockNotifications {
  /// GET /api/v1/notifications
  ///
  /// - authentication (requires user)
  /// - read read:notifications
  ///
  /// https://docs.joinmastodon.org/api/rest/notifications/#get-api-v1-notifications
  Future<List<Notification>> notifications({
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
    List<NotificationType> excludeTypes,
    String account_id,
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
        "exclude_types": excludeTypes.map((e) => e.toString().split(".").last),
        "account_id": account_id,
      }..removeWhere((_, value) => value == null),
    );

    final body = List<Map>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body.map((m) => Notification.fromJson(m)).toList();
  }

  /// GET /api/v1/notifications/:id
  ///
  /// - authentication (requires user)
  /// - read read:notifications
  ///
  /// https://docs.joinmastodon.org/api/rest/notifications/#get-api-v1-notifications-id
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
  ///
  /// https://docs.joinmastodon.org/api/rest/notifications/#post-api-v1-notifications-clear
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
  ///
  /// https://docs.joinmastodon.org/api/rest/notifications/#post-api-v1-notifications-dismiss
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

  /// POST /api/v1/push/subscription
  ///
  /// - authentication (requires user)
  /// - push
  ///
  /// https://docs.joinmastodon.org/api/rest/notifications/#post-api-v1-push-subscription

  /// TODO: implement push subscriptions mocks

  /// GET /api/v1/push/subscription
  ///
  /// - authentication (requires user)
  /// - push
  ///
  /// https://docs.joinmastodon.org/api/rest/notifications/#get-api-v1-push-subscription

  /// TODO: implement push subscriptions mocks

  /// PUT /api/v1/push/subscription
  ///
  /// - authentication (requires user)
  /// - push
  ///
  /// https://docs.joinmastodon.org/api/rest/notifications/#put-api-v1-push-subscription

  /// TODO: implement push subscriptions mocks

  /// DELETE /api/v1/push/subscription
  ///
  /// - authentication (requires user)
  /// - push
  ///
  /// https://docs.joinmastodon.org/api/rest/notifications/#delete-api-v1-push-subscription

  /// TODO: implement push subscriptions mocks
}
