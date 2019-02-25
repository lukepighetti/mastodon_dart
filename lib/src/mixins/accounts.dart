import '../library.dart';

import 'package:mastodon/mock/mixins/accounts.dart';

mixin Accounts on Authentication implements MockAccountsMixin {
  /// GET /api/v1/accounts/:id
  ///
  /// - public
  /// - read read:accounts
  ///
  /// https://docs.joinmastodon.org/api/rest/accounts/#get-api-v1-accounts-id
  Future<Account> account(String id) async {
    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/$id",
    );

    final response = await get(
      uri,
    );

    return Account.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/accounts
  ///
  /// - authenticated (no user required)
  /// - write write:accounts
  ///
  /// https://docs.joinmastodon.org/api/rest/accounts/#post-api-v1-accounts
  Future<Token> token({
    @required String username,
    @required String email,
    @required String password,
    @required bool agreement,
    @required String locale,
  }) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts",
      queryParameters: {
        "username": username,
        "email": email,
        "password": password,
        "agreement": agreement.toString(),
        "locale": locale,
      },
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/verify_credentials",
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
        scheme: baseUrl.scheme,
        host: baseUrl.host,
        path: "/api/v1/accounts/verify_credentials",
        queryParameters: {
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
        });

    final response = await patch(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/$id/followers",
      queryParameters: {
        "limit": limit,
      },
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/$id/following",
      queryParameters: {
        "limit": limit,
      },
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/$id/statuses",
      queryParameters: {
        "only_media": onlyMedia.toString(),
        "pinned": pinned.toString(),
        "exclude_replies": excludeReplies.toString(),
        "max_id": maxId,
        "since_id": sinceId,
        "limit": limit,
        "exclude_reblogs": excludeReblogs.toString(),
      },
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/$id/follow",
      queryParameters: {
        "reblogs": reblogs.toString(),
      },
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/$id/unfollow",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/relationships",
      queryParameters: {
        "ids": ids,
      },
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/search",
      queryParameters: {
        "q": q,
        "limit": limit,
        "resolve": resolve.toString(),
        "following": following.toString(),
      },
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }
}
