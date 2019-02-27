import '../library.dart';

import '../../mock/endpoints/mutes.dart';

mixin Mutes on Authentication, Utilities implements MockMutes {
  /// GET /api/v1/mutes
  ///
  /// - authentication (requires user)
  /// - read:mutes follow
  ///
  /// https://docs.joinmastodon.org/api/rest/mutes/#get-api-v1-mutes
  Future<List<Account>> mutes({int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/mutes",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// POST /api/v1/accounts/:id/mute
  ///
  /// - authentication (requires user)
  /// - write:mutes follow
  ///
  /// https://docs.joinmastodon.org/api/rest/mutes/#post-api-v1-accounts-id-mute
  Future<Relationship> muteAccount(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/mute",
      authenticated: true,
    );

    return Relationship.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/accounts/:id/unmute
  ///
  /// - authentication (requires user)
  /// - write:mutes follow
  ///
  /// https://docs.joinmastodon.org/api/rest/mutes/#post-api-v1-accounts-id-unmute
  Future<Relationship> unmuteAccount(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/unmute",
      authenticated: true,
    );

    return Relationship.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/mute
  ///
  /// - authentication (requires user)
  /// - write write:mutes
  ///
  /// https://docs.joinmastodon.org/api/rest/mutes/#post-api-v1-statuses-id-mute
  Future<Status> muteStatus(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/mute",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/unmute
  ///
  /// - authentication (requires user)
  /// - write write:mutes
  ///
  /// https://docs.joinmastodon.org/api/rest/mutes/#post-api-v1-statuses-id-unmute
  Future<Status> unmuteStatus(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/unmute",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }
}
