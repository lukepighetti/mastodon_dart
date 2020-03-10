import 'package:mastodon_dart/mastodon.dart';

class MockNotifications {
  /// GET /api/v1/notifications
  /// https://docs.joinmastodon.org/api/rest/notifications/#get-api-v1-notifications
  Future<List<Notification>> notifications({
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
    List<NotificationType> excludeTypes,
  }) =>
      Future.value(List.generate(limit, (_) => Notification.mock()));

  /// GET /api/v1/notifications/:id
  /// https://docs.joinmastodon.org/api/rest/notifications/#get-api-v1-notifications-id
  Future<Notification> notification(String id) =>
      Future.value(Notification.mock());

  /// POST /api/v1/notifications/clear
  /// https://docs.joinmastodon.org/api/rest/notifications/#post-api-v1-notifications-clear
  Future<dynamic> clearNotifications() => Future.value(null);

  /// POST /api/v1/notifications/dismiss
  /// https://docs.joinmastodon.org/api/rest/notifications/#post-api-v1-notifications-dismiss
  Future<dynamic> dismissNotification(String id) => Future.value(null);

  /// POST /api/v1/push/subscription
  /// https://docs.joinmastodon.org/api/rest/notifications/#post-api-v1-push-subscription
  ///
  /// TODO: implement push subscriptions mocks

  /// GET /api/v1/push/subscription
  /// https://docs.joinmastodon.org/api/rest/notifications/#get-api-v1-push-subscription
  ///
  /// TODO: implement push subscriptions mocks

  /// PUT /api/v1/push/subscription
  /// https://docs.joinmastodon.org/api/rest/notifications/#put-api-v1-push-subscription
  ///
  /// TODO: implement push subscriptions mocks

  /// DELETE /api/v1/push/subscription
  /// https://docs.joinmastodon.org/api/rest/notifications/#delete-api-v1-push-subscription
  ///
  /// TODO: implement push subscriptions mocks
}
