import '../library.dart';

import '../mock/mixins/domain_blocks.dart';

mixin DomainBlocks on Authentication implements MockDomainBlocksMixin {
  /// GET /api/v1/domain_blocks
  ///
  /// - authenticated (requires user)
  /// - read read:blocks follow
  ///
  /// https://docs.joinmastodon.org/api/rest/domain-blocks/#get-api-v1-domain-blocks
  Future<List<Uri>> domainBlocks({int limit = 40}) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/domain_blocks",
      queryParameters: {
        "limit": limit.toString(),
      },
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    final body = List<String>.from(json.decode(response.body));

    return body.map((s) => Uri.parse(s)).toList();
  }

  /// POST /api/v1/domain_blocks
  ///
  /// - authenticated (requires user)
  /// - write write:blocks follow
  ///
  /// https://docs.joinmastodon.org/api/rest/domain-blocks/#post-api-v1-domain-blocks
  Future<dynamic> domainBlock(Uri domain) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/domain_blocks",
    );

    await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
      body: {
        "domain": domain.toString(),
      },
    );
  }

  /// DELETE /api/v1/domain_blocks
  ///
  /// - authenticated (requires user)
  /// - write write:blocks follow
  ///
  /// https://docs.joinmastodon.org/api/rest/domain-blocks/#delete-api-v1-domain-blocks
  Future<dynamic> domainUnblock(Uri domain) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/domain_blocks",
      queryParameters: {
        "domain": domain.toString(),
      },
    );

    await delete(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );
  }
}
