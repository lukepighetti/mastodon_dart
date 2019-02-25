import '../library.dart';

import 'package:mastodon/mock/mixins/blocks.dart';

mixin Blocks on Authentication implements MockBlocksMixin {
  /// GET /api/v1/blocks
  ///
  /// - authenticated (requires user)
  /// - read:blocks follow
  ///
  /// https://docs.joinmastodon.org/api/rest/blocks/#get-api-v1-blocks
  Future<List<Account>> blocks({int limit = 40}) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/blocks",
      queryParameters: {
        "limit": limit,
      },
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// POST /api/v1/accounts/:id/block
  ///
  /// - authenticated (requires user)
  /// - write:blocks follow
  ///
  /// https://docs.joinmastodon.org/api/rest/blocks/#post-api-v1-accounts-id-block
  Future<Relationship> block(String id) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/$id/block",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return Relationship.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/accounts/:id/unblock
  ///
  /// - authenticated (requires user)
  /// - write:blocks follow
  ///
  /// https://docs.joinmastodon.org/api/rest/blocks/#post-api-v1-accounts-id-unblock
  Future<Relationship> unblock(String id) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/$id/unblock",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return Relationship.fromJson(json.decode(response.body));
  }
}
