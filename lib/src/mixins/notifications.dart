import '../library.dart';

import 'package:mastodon/mock/mixins/notifications.dart';

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
  }) =>
      throw UnimplementedError();

  /// GET /api/v1/notifications/:id
  ///
  /// - authentication (requires user)
  /// - read read:notifications
  ///
  /// https://docs.joinmastodon.org/api/rest/notifications/#get-api-v1-notifications-id
  Future<Notification> notification(String id) => throw UnimplementedError();

  /// POST /api/v1/notifications/clear
  ///
  /// - authentication (requires user)
  /// - write write:notifications
  ///
  /// https://docs.joinmastodon.org/api/rest/notifications/#post-api-v1-notifications-clear
  Future<dynamic> clearNotifications() => throw UnimplementedError();

  /// POST /api/v1/notifications/dismiss
  ///
  /// - authentication (requires user)
  /// - write write:notifications
  ///
  /// https://docs.joinmastodon.org/api/rest/notifications/#post-api-v1-notifications-dismiss
  Future<dynamic> dismissNotification(String id) => throw UnimplementedError();

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
