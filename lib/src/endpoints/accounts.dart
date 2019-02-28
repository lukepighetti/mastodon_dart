import '../library.dart';

import '../../mock/endpoints/accounts.dart';

mixin Accounts on Authentication, Utilities implements MockAccounts {
  /// GET /api/v1/accounts/:id
  ///
  /// - public
  /// - read read:accounts
  ///
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-id
  Future<Account> account(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/$id",
    );

    return Account.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/accounts
  ///
  /// - authenticated (no user required)
  /// - write write:accounts
  ///
  /// https://docs.joinmastodon.org/api/rest/accounts/#post-api-v1-accounts
  Future<Token> requestToken(
    String username,
    String email,
    String password,
    bool agreement,
    String locale,
  ) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts",
      authenticated: true,
      payload: {
        "username": username,
        "email": email,
        "password": password,
        "agreement": agreement.toString(),
        "locale": locale,
      },
    );

    return Token.fromJson(json.decode(response.body));
  }

  /// GET /api/v1/accounts/verify_credentials
  ///
  /// - authenticated (requires user)
  /// - read read:accounts
  ///
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-verify-credentials
  Future<Account> verifyCredentials() async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/verify_credentials",
      authenticated: true,
    );

    return Account.fromJson(json.decode(response.body));
  }

  /// PATCH /api/v1/accounts/update_credentials
  ///
  /// - authenticated (requires user)
  /// - write write:accounts
  ///
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
  }) async {
    final response = await request(
      Method.patch,
      "/api/v1/accounts/verify_credentials",
      authenticated: true,
      payload: {
        "display_name": displayName,
        "note": note,

        /// TODO:  Avatar encoded using multipart/form-data
        "avatar": null,

        /// TODO: Header image encoded using multipart/form-data
        "header": null,
        "locked": locked == null ? null : locked.toString(),

        /// TODO: implement source
        "source": null,

        /// TODO: implement fields_attributes
        "fields_attributes": null,
      },
    );

    return Account.fromJson(json.decode(response.body));
  }

  /// GET /api/v1/accounts/:id/followers
  ///
  /// - authenticated
  /// - read read:accounts
  ///
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-id-followers
  Future<List<Account>> followers(String id, {int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/$id/followers",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// GET /api/v1/accounts/:id/following
  ///
  /// - authenticated
  /// - read read:accounts
  ///
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-id-following
  Future<List<Account>> following(String id, {int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/$id/following",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// GET /api/v1/accounts/:id/statuses
  ///
  /// - authenticated
  /// - read read:statuses
  ///
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
  }) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/$id/statuses",
      authenticated: true,
      payload: {
        "only_media": onlyMedia.toString(),
        "pinned": pinned.toString(),
        "exclude_replies": excludeReplies.toString(),
        "max_id": maxId,
        "since_id": sinceId,
        "limit": limit.toString(),
        "exclude_reblogs": excludeReblogs.toString(),
      },
    );

    final body = List<Map>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body.map((m) => Status.fromJson(m)).toList();
  }

  /// POST /api/v1/accounts/:id/follow
  ///
  /// - authenticated
  /// - write:follows follow
  ///
  /// https://docs.joinmastodon.org/api/rest/accounts/#post-api-v1-accounts-id-follow
  Future<Relationship> follow(String id, {bool reblogs = true}) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/follow",
      authenticated: true,
      payload: {
        "reblogs": reblogs.toString(),
      },
    );

    return Relationship.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/accounts/:id/unfollow
  ///
  /// - authenticated
  /// - write:follows follow
  ///
  /// https://docs.joinmastodon.org/api/rest/accounts/#post-api-v1-accounts-id-unfollow
  Future<Relationship> unfollow(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/unfollow",
      authenticated: true,
    );

    return Relationship.fromJson(json.decode(response.body));
  }

  /// GET /api/v1/accounts/relationships
  ///
  /// - authenticated
  /// - read read:follows
  ///
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-relationships
  Future<List<Relationship>> relationships(List<String> ids) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/relationships",
      authenticated: true,
      payload: {
        "ids": ids,
      },
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Relationship.fromJson(m)).toList();
  }

  /// GET /api/v1/accounts/search
  ///
  /// - authenticated
  /// - read read:accounts
  ///
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-search
  Future<List<Account>> searchAccounts(
    String q, {
    int limit = 40,
    bool resolve = false,
    bool following = false,
  }) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/search",
      authenticated: true,
      payload: {
        "q": q,
        "limit": limit.toString(),
        "resolve": resolve.toString(),
        "following": following.toString(),
      },
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }
}
