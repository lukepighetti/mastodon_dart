import '../library.dart';

import '../mock/mixins/notifications.dart';

mixin Notifications on Authentication implements MockNotificationsMixin {
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
  }) async {
    assert(key != null);

    final uri = baseUrl.replace(
      path: "/api/v1/notifications",
      queryParameters: {
        "max_id": maxId,
        "since_id": sinceId,
        "min_id": minId,
        "limit": limit.toString(),
        "exclude_types": excludeTypes.map((e) => e.toString().split(".").last),
      }..removeWhere((_, value) => value == null),
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = baseUrl.replace(
      path: "/api/v1/notifications/$id",
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = baseUrl.replace(
      path: "/api/v1/notifications/clear",
    );

    await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );
  }

  /// POST /api/v1/notifications/dismiss
  ///
  /// - authentication (requires user)
  /// - write write:notifications
  ///
  /// https://docs.joinmastodon.org/api/rest/notifications/#post-api-v1-notifications-dismiss
  Future<dynamic> dismissNotification(String id) async {
    assert(key != null);

    final uri = baseUrl.replace(
      path: "/api/v1/notifications/dismiss",
    );

    await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
      body: {
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
