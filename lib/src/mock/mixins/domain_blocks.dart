import '../properties.dart';

class MockDomainBlocksMixin {
  /// GET /api/v1/domain_blocks
  /// https://docs.joinmastodon.org/api/rest/domain-blocks/#get-api-v1-domain-blocks
  Future<List<Uri>> domainBlocks({int limit = 40}) =>
      Future.value(List.generate(5, (_) => MockProperties.uri));

  /// POST /api/v1/domain_blocks
  /// https://docs.joinmastodon.org/api/rest/domain-blocks/#post-api-v1-domain-blocks
  Future<dynamic> domainBlock(Uri domain) => Future.value(null);

  /// DELETE /api/v1/domain_blocks
  /// https://docs.joinmastodon.org/api/rest/domain-blocks/#delete-api-v1-domain-blocks
  Future<dynamic> domainUnblock(Uri domain) => Future.value(null);
}
