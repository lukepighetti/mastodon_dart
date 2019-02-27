import '../library.dart';

import '../mock/mixins/follow_requests.dart';

mixin FollowRequests on Authentication implements MockFollowRequestsMixin {
  /// GET /api/v1/follow_requests
  ///
  /// - authenticated (requires user)
  /// - read read:follows follow
  ///
  /// https://docs.joinmastodon.org/api/rest/follow-requests/#get-api-v1-follow-requests
  Future<List<Account>> followRequests({int limit = 40}) async {
    assert(key != null);

    final uri = baseUrl.replace(
      path: "/api/v1/follow_requests",
      queryParameters: {
        "limit": limit.toString(),
      },
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = baseUrl.replace(
      path: "/api/v1/follow_requests/$id/authorize",
    );

    await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );
  }

  /// POST /api/v1/follow_requests/:id/reject
  ///
  /// - authenticated (requires user)
  /// - write:follows follow
  ///
  /// https://docs.joinmastodon.org/api/rest/follow-requests/#post-api-v1-follow-requests-id-reject
  Future<dynamic> rejectRequest(String id) async {
    assert(key != null);

    final uri = baseUrl.replace(
      path: "/api/v1/follow_requests/$id/reject",
    );

    await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );
  }
}
