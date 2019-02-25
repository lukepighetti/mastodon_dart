import '../library.dart';

import 'package:mastodon/mock/mixins/blocks.dart';

mixin Blocks on Authentication implements MockBlocksMixin {
  /// GET /api/v1/blocks
  /// https://docs.joinmastodon.org/api/rest/blocks/#get-api-v1-blocks
  Future<List<Account>> blocks({int limit = 40}) => throw UnimplementedError();

  /// POST /api/v1/accounts/:id/block
  /// https://docs.joinmastodon.org/api/rest/blocks/#post-api-v1-accounts-id-block
  Future<Relationship> block(String id) => throw UnimplementedError();

  /// POST /api/v1/accounts/:id/unblock
  /// https://docs.joinmastodon.org/api/rest/blocks/#post-api-v1-accounts-id-unblock
  Future<Relationship> unblock(String id) => throw UnimplementedError();
}
