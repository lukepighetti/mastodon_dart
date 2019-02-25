import '../library.dart';

import 'package:mastodon/mock/mixins/accounts.dart';

mixin Accounts on Authentication implements MockAccountsMixin {
  /// GET /api/v1/accounts/:id
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-id
  Future<Account> account(String id) => Future.value(Account.mock());

  /// POST /api/v1/accounts
  /// https://docs.joinmastodon.org/api/rest/accounts/#post-api-v1-accounts
  Future<Token> token({
    @required String username,
    @required String email,
    @required String password,
    @required bool agreement,
    @required String locale,
  }) =>
      throw UnimplementedError();

  /// GET /api/v1/accounts/verify_credentials
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-verify-credentials
  Future<Account> verifyCredentials() => throw UnimplementedError();

  /// PATCH /api/v1/accounts/update_credentials
  /// https://docs.joinmastodon.org/api/rest/accounts/#patch-api-v1-accounts-update-credentials
  Future<Account> updateCredentials({
    String displayName,
    String note,
    dynamic avatar,
    dynamic header,
    bool locked,
    dynamic sourcePrivacy,
    dynamic sourceSensitive,
    dynamic sourceLanguage,
    dynamic fieldsAttributes,
  }) =>
      throw UnimplementedError();

  /// GET /api/v1/accounts/:id/followers
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-id-followers
  Future<List<Account>> followers(String id, {int limit = 40}) =>
      throw UnimplementedError();

  /// GET /api/v1/accounts/:id/following
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-id-following
  Future<List<Account>> following(String id, {int limit = 40}) =>
      throw UnimplementedError();

  /// GET /api/v1/accounts/:id/statuses
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-id-statuses
  Future<List<Status>> statuses(
    String id, {
    bool onlyMedia = false,
    bool pinned = false,
    bool excludeReplies = false,
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
    bool excludeReblogs = false,
  }) =>
      throw UnimplementedError();

  /// POST /api/v1/accounts/:id/follow
  /// https://docs.joinmastodon.org/api/rest/accounts/#post-api-v1-accounts-id-follow
  Future<Relationship> follow(String id, {bool reblogs = true}) =>
      throw UnimplementedError();

  /// POST /api/v1/accounts/:id/unfollow
  /// https://docs.joinmastodon.org/api/rest/accounts/#post-api-v1-accounts-id-unfollow
  Future<Relationship> unfollow(String id) => throw UnimplementedError();

  /// GET /api/v1/accounts/relationships
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-relationships
  Future<List<Relationship>> relationships(List<String> ids) =>
      throw UnimplementedError();

  /// GET /api/v1/accounts/search
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-search
  Future<List<Account>> searchAccounts(
    String q, {
    int limit = 40,
    bool resolve = false,
    bool following = false,
  }) =>
      throw UnimplementedError();
}
