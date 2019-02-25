import '../library.dart';

import '../mock/mixins/mutes.dart';

mixin Mutes on Authentication implements MockMutesMixin {
  /// GET /api/v1/mutes
  ///
  /// - authentication (requires user)
  /// - read:mutes follow
  ///
  /// https://docs.joinmastodon.org/api/rest/mutes/#get-api-v1-mutes
  Future<List<Account>> mutes({int limit = 40}) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/mutes",
      queryParameters: {
        "limit": limit,
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

  /// POST /api/v1/accounts/:id/mute
  ///
  /// - authentication (requires user)
  /// - write:mutes follow
  ///
  /// https://docs.joinmastodon.org/api/rest/mutes/#post-api-v1-accounts-id-mute
  Future<Relationship> muteAccount(String id) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/$id/mute",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/$id/unmute",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/statuses/$id/mute",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/statuses/$id/unmute",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return Status.fromJson(json.decode(response.body));
  }
}
