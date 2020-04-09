import 'package:mastodon_dart/mastodon_dart.dart';

class MockPush {
  /// POST /api/v1/push/subscription
  Future<PushSubscription> subscribeToNotifications() => Future.value(PushSubscription.mock());

  /// GET /api/v1/push/subscription
  Future<PushSubscription> getSubscription() => Future.value(PushSubscription.mock());

  /// PUT /api/v1/push/subscription
  Future<PushSubscription> updateSubscription() => Future.value(PushSubscription.mock());

  /// DELETE /api/v1/push/subscription
  Future<PushSubscription> removeSubscription() => Future.value(PushSubscription.mock());
}