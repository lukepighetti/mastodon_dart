import '../library.dart';
import '../../src/mock/endpoints/push.dart';

/// Subscribe to and receive push notifications when a server-side notification is received, via the Web Push API
/// https://docs.joinmastodon.org/methods/notifications/push/
mixin Push on Authentication, Utilities implements MockPush {
  /// POST /api/v1/push/subscription
  ///
  /// - authentication (requires user)
  /// - push
  Future<PushSubscription> subscribeToPushNotifications() async {
    final response = await request(
      Method.post,
      "/api/v1/push/subscription",
      authenticated: true,
    );

    return PushSubscription.fromJson(json.decode(response.body));
  }

  /// GET /api/v1/push/subscription
  ///
  /// - authentication (requires user)
  /// - push
  Future<PushSubscription> getSubscription() async {
    final response = await request(
      Method.get,
      "/api/v1/push/subscription",
      authenticated: true,
    );

    return PushSubscription.fromJson(json.decode(response.body));
  }

  /// PUT /api/v1/push/subscription
  ///
  /// - authentication (requires user)
  /// - push
  Future<PushSubscription> updateSubscription() async {
    final response = await request(
      Method.put,
      "/api/v1/push/subscription",
      authenticated: true,
    );

    return PushSubscription.fromJson(json.decode(response.body));
  }

  /// DELETE /api/v1/push/subscription
  ///
  /// - authentication (requires user)
  /// - push
  Future<PushSubscription> removeSubscription() async {
    final response = await request(
      Method.delete,
      "/api/v1/push/subscription",
      authenticated: true,
    );

    return PushSubscription.fromJson(json.decode(response.body));
  }
}
