import 'package:mastodon/mastodon.dart';

class MockBlocks {
  /// GET /api/v1/blocks
  /// https://docs.joinmastodon.org/api/rest/blocks/#get-api-v1-blocks
  Future<List<Account>> blocks({int limit = 40}) =>
      Future.value(List.generate(limit, (_) => Account.mock()));

  /// POST /api/v1/accounts/:id/block
  /// https://docs.joinmastodon.org/api/rest/blocks/#post-api-v1-accounts-id-block
  Future<Relationship> block(String id) => Future.value(Relationship.mock());

  /// POST /api/v1/accounts/:id/unblock
  /// https://docs.joinmastodon.org/api/rest/blocks/#post-api-v1-accounts-id-unblock
  Future<Relationship> unblock(String id) => Future.value(Relationship.mock());
}
