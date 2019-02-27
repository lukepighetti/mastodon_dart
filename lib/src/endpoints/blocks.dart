import '../library.dart';

import '../mock/endpoints/blocks.dart';

mixin Blocks on Authentication, Utilities implements MockBlocksMixin {
  /// GET /api/v1/blocks
  ///
  /// - authenticated (requires user)
  /// - read:blocks follow
  ///
  /// https://docs.joinmastodon.org/api/rest/blocks/#get-api-v1-blocks
  Future<List<Account>> blocks({int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/blocks",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
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
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/block",
      authenticated: true,
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
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/unblock",
      authenticated: true,
    );

    return Relationship.fromJson(json.decode(response.body));
  }
}
