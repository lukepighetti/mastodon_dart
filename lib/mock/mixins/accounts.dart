import 'package:mastodon/mastodon.dart';
import 'package:meta/meta.dart';

class MockAccountsMixin {
  /// GET /api/v1/accounts/:id
  Future<Account> account(String id) => Future.value(Account.mock());

  /// POST /api/v1/accounts
  Future<Token> token({
    @required String username,
    @required String email,
    @required String password,
    @required bool agreement,
    @required String locale,
  }) =>
      Future.value(Token.mock());

  /// GET /api/v1/accounts/verify_credentials
  Future<Account> verifyCredentials() => Future.value(Account.mock());

  /// PATCH /api/v1/accounts/update_credentials
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
  Future<List<Account>> followers(String id, {int limit = 40}) =>
      Future.value(List.generate((limit), (_) => Account.mock()));

  /// GET /api/v1/accounts/:id/following
  Future<List<Account>> following(String id, {int limit = 40}) =>
      Future.value(List.generate((limit), (_) => Account.mock()));

  /// GET /api/v1/accounts/:id/statuses
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
  Future<Relationship> follow(String id, {bool reblogs = true}) =>
      Future.value(Relationship.mock());

  /// POST /api/v1/accounts/:id/unfollow
  Future<Relationship> unfollow(String id) => Future.value(Relationship.mock());

  /// GET /api/v1/accounts/relationships
  Future<List<Relationship>> relationships(List<String> ids) =>
      Future.value(List.generate((ids.length), (_) => Relationship.mock()));

  /// GET /api/v1/accounts/search
  Future<List<Account>> search(
    String q, {
    int limit = 40,
    bool resolve = false,
    bool following = false,
  }) =>
      Future.value(List.generate((limit), (_) => Account.mock()));
}
