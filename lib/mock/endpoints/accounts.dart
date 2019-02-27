import 'package:mastodon/mastodon.dart';

class MockAccounts {
  /// GET /api/v1/accounts/:id
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-id
  Future<Account> account(String id) => Future.value(Account.mock());

  /// POST /api/v1/accounts
  /// https://docs.joinmastodon.org/api/rest/accounts/#post-api-v1-accounts
  Future<Token> token(
    String username,
    String email,
    String password,
    bool agreement,
    String locale,
  ) =>
      Future.value(Token.mock());

  /// GET /api/v1/accounts/verify_credentials
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-verify-credentials
  Future<Account> verifyCredentials() => Future.value(Account.mock());

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
      Future.value(Account.mock());

  /// GET /api/v1/accounts/:id/followers
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-id-followers
  Future<List<Account>> followers(String id, {int limit = 40}) =>
      Future.value(List.generate((limit), (_) => Account.mock()));

  /// GET /api/v1/accounts/:id/following
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-id-following
  Future<List<Account>> following(String id, {int limit = 40}) =>
      Future.value(List.generate((limit), (_) => Account.mock()));

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
      Future.value(List.generate((limit), (_) => Status.mock()));

  /// POST /api/v1/accounts/:id/follow
  /// https://docs.joinmastodon.org/api/rest/accounts/#post-api-v1-accounts-id-follow
  Future<Relationship> follow(String id, {bool reblogs = true}) =>
      Future.value(Relationship.mock());

  /// POST /api/v1/accounts/:id/unfollow
  /// https://docs.joinmastodon.org/api/rest/accounts/#post-api-v1-accounts-id-unfollow
  Future<Relationship> unfollow(String id) => Future.value(Relationship.mock());

  /// GET /api/v1/accounts/relationships
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-relationships
  Future<List<Relationship>> relationships(List<String> ids) =>
      Future.value(List.generate((ids.length), (_) => Relationship.mock()));

  /// GET /api/v1/accounts/search
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-search
  Future<List<Account>> searchAccounts(
    String q, {
    int limit = 40,
    bool resolve = false,
    bool following = false,
  }) =>
      Future.value(List.generate((limit), (_) => Account.mock()));
}
