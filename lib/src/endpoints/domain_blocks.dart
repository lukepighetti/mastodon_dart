import '../library.dart';

import '../../mock/endpoints/domain_blocks.dart';

mixin DomainBlocks on Authentication, Utilities implements MockDomainBlocks {
  /// GET /api/v1/domain_blocks
  ///
  /// - authenticated (requires user)
  /// - read read:blocks follow
  ///
  /// https://docs.joinmastodon.org/api/rest/domain-blocks/#get-api-v1-domain-blocks
  Future<List<Uri>> domainBlocks({int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/domain_blocks",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
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
    await request(
      Method.post,
      "/api/v1/domain_blocks",
      authenticated: true,
      payload: {
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
    await request(
      Method.delete,
      "/api/v1/domain_blocks",
      authenticated: true,
      payload: {
        "domain": domain.toString(),
      },
    );
  }
}
