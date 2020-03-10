import 'package:mastodon_dart/mastodon_dart.dart';

class MockFollowRequests {
  /// GET /api/v1/follow_requests
  /// https://docs.joinmastodon.org/api/rest/follow-requests/#get-api-v1-follow-requests
  Future<List<Account>> followRequests({int limit = 40}) =>
      Future.value(List.generate(limit, (_) => Account.mock()));

  /// POST /api/v1/follow_requests/:id/authorize
  /// https://docs.joinmastodon.org/api/rest/follow-requests/#post-api-v1-follow-requests-id-authorize
  Future<dynamic> authorizeRequest(String id) => Future.value(null);

  /// POST /api/v1/follow_requests/:id/reject
  /// https://docs.joinmastodon.org/api/rest/follow-requests/#post-api-v1-follow-requests-id-reject
  Future<dynamic> rejectRequest(String id) => Future.value(null);
}
