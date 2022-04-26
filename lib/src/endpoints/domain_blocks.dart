import '../library.dart';

mixin DomainBlocks on Authentication, Utilities {
  /// GET /api/v1/domain_blocks
  ///
  /// - authenticated (requires user)
  /// - read read:blocks follow
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
