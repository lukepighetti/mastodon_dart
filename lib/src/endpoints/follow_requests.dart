import '../library.dart';

import '../mock/endpoints/follow_requests.dart';

mixin FollowRequests
    on Authentication, Utilities
    implements MockFollowRequests {
  /// GET /api/v1/follow_requests
  ///
  /// - authenticated (requires user)
  /// - read read:follows follow
  ///
  /// https://docs.joinmastodon.org/api/rest/follow-requests/#get-api-v1-follow-requests
  Future<List<Account>> followRequests({int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/follow_requests",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// POST /api/v1/follow_requests/:id/authorize
  ///
  /// - authenticated (requires user)
  /// - write:follows follow
  ///
  /// https://docs.joinmastodon.org/api/rest/follow-requests/#post-api-v1-follow-requests-id-authorize
  Future<dynamic> authorizeRequest(String id) async {
    await request(
      Method.post,
      "/api/v1/follow_requests/$id/authorize",
      authenticated: true,
    );
  }

  /// POST /api/v1/follow_requests/:id/reject
  ///
  /// - authenticated (requires user)
  /// - write:follows follow
  ///
  /// https://docs.joinmastodon.org/api/rest/follow-requests/#post-api-v1-follow-requests-id-reject
  Future<dynamic> rejectRequest(String id) async {
    await request(
      Method.post,
      "/api/v1/follow_requests/$id/reject",
      authenticated: true,
    );
  }
}
