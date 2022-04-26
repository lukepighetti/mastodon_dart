import 'dart:convert';

import '../authentication.dart';
import '../data/account.dart';
import '../data/relationship.dart';
import '../data/status.dart';
import '../utilities.dart';

/// Methods concerning user accounts and related information.
/// https://docs.joinmastodon.org/methods/accounts/
mixin Accounts on Authentication, Utilities {
  /// Creates a user and account records. Returns an account access token for the app that initiated the request.
  /// The app should save this token for later, and should wait for the user to confirm their account by clicking a link in their email inbox.
  ///
  /// GET /api/v1/accounts/:id
  ///
  /// - public
  /// - read read:accounts
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

  /// Test to make sure that the user token works.
  ///
  /// GET /api/v1/accounts/verify_credentials
  ///
  /// - authenticated (requires user)
  /// - read read:accounts
  Future<Account> verifyCredentials() async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/verify_credentials",
      authenticated: true,
    );

    return Account.fromJson(json.decode(response.body));
  }

  /// Update the user's display and preferences.
  ///
  /// PATCH /api/v1/accounts/update_credentials
  ///
  /// - authenticated (requires user)
  /// - write write:accounts
  Future<Account> updateCredentials({
    String? displayName,
    String? note,
    // Object? avatar,
    // Object? header,
    bool? locked,
    // Object? sourcePrivacy,
    // Object? sourceSensitive,
    // Object? sourceLanguage,
    // Object? fieldsAttributes,
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
        "locked": locked?.toString(),

        /// TODO: implement source
        "source": null,

        /// TODO: implement fields_attributes
        "fields_attributes": null,
      },
    );

    return Account.fromJson(json.decode(response.body));
  }

  /// Accounts which follow the given account, if network is not hidden by the account owner.
  ///
  /// GET /api/v1/accounts/:id/followers
  ///
  /// - authenticated
  /// - read read:accounts
  Future<List<Account>> followers(String id, {int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/$id/followers",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// Accounts which the given account is following, if network is not hidden by the account owner.
  ///
  /// GET /api/v1/accounts/:id/following
  ///
  /// - authenticated
  /// - read read:accounts
  Future<List<Account>> following(String id, {int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/$id/following",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// Statuses posted to the given account.
  ///
  /// GET /api/v1/accounts/:id/statuses
  ///
  /// - authenticated
  /// - read read:statuses
  Future<List<Status>> statuses(
    String id, {
    bool onlyMedia = false,
    bool pinned = false,
    bool excludeReplies = false,
    String? maxId,
    String? sinceId,
    String? minId,
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

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body.map((m) => Status.fromJson(m)).toList();
  }

  /// Follow the given account.
  ///
  /// POST /api/v1/accounts/:id/follow
  ///
  /// - authenticated
  /// - write:follows follow
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

  /// Unfollow the given account.
  ///
  /// POST /api/v1/accounts/:id/unfollow
  ///
  /// - authenticated
  /// - write:follows follow
  Future<Relationship> unfollow(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/unfollow",
      authenticated: true,
    );

    return Relationship.fromJson(json.decode(response.body));
  }

  /// Find out whether a given account is followed, blocked, muted, etc.
  ///
  /// GET /api/v1/accounts/relationships
  ///
  /// - authenticated
  /// - read read:follows
  Future<List<Relationship>> relationships(List<String> ids) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/relationships",
      authenticated: true,
      payload: {
        "ids": ids,
      },
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    return body.map((m) => Relationship.fromJson(m)).toList();
  }

  /// Search for matching accounts by username or display name.
  ///
  /// GET /api/v1/accounts/search
  ///
  /// - authenticated
  /// - read read:accounts
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

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }
}
