import '../authentication.dart';
import '../models/account.dart';
import '../models/relationship.dart';
import '../models/status.dart';
import '../response.dart';
import '../result.dart';
import '../utilities.dart';
import 'timelines.dart';

typedef AccountResponse = Response<Result<Account>>;
typedef AccountsResponse = Response<List<Result<Account>>>;
typedef RelationshipResponse = Response<Result<Relationship>>;
typedef RelationshipsResponse = Response<List<Result<Relationship>>>;
typedef TokenResponse = Response<Result<Token>>;

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
  Future<AccountResponse> account(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/$id",
    );

    return Response.from(response.body, Account.fromJson);
  }

  /// POST /api/v1/accounts
  ///
  /// - authenticated (no user required)
  /// - write write:accounts
  Future<TokenResponse> requestToken(
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

    return Response.from(response.body, Token.fromJson);
  }

  /// Test to make sure that the user token works.
  ///
  /// GET /api/v1/accounts/verify_credentials
  ///
  /// - authenticated (requires user)
  /// - read read:accounts
  Future<AccountResponse> verifyCredentials() async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/verify_credentials",
      authenticated: true,
    );

    return Response.from(response.body, Account.fromJson);
  }

  /// Update the user's display and preferences.
  ///
  /// PATCH /api/v1/accounts/update_credentials
  ///
  /// - authenticated (requires user)
  /// - write write:accounts
  Future<AccountResponse> updateCredentials({
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

    return Response.from(response.body, Account.fromJson);
  }

  /// Accounts which follow the given account, if network is not hidden by the account owner.
  ///
  /// GET /api/v1/accounts/:id/followers
  ///
  /// - authenticated
  /// - read read:accounts
  Future<AccountsResponse> followers(String id, {int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/$id/followers",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    return Response.fromList(response.body, Account.fromJson);
  }

  /// Accounts which the given account is following, if network is not hidden by the account owner.
  ///
  /// GET /api/v1/accounts/:id/following
  ///
  /// - authenticated
  /// - read read:accounts
  Future<AccountsResponse> following(String id, {int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/$id/following",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    return Response.fromList(response.body, Account.fromJson);
  }

  /// Statuses posted to the given account.
  ///
  /// GET /api/v1/accounts/:id/statuses
  ///
  /// - authenticated
  /// - read read:statuses
  Future<TimelineResponse> statuses(
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

    return Response.fromList(response.body, Status.fromJson);
  }

  /// Follow the given account.
  ///
  /// POST /api/v1/accounts/:id/follow
  ///
  /// - authenticated
  /// - write:follows
  Future<RelationshipResponse> follow(String id, {bool reblogs = true}) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/follow",
      authenticated: true,
      payload: {
        "reblogs": reblogs.toString(),
      },
    );

    return Response.from(response.body, Relationship.fromJson);
  }

  /// Unfollow the given account.
  ///
  /// POST /api/v1/accounts/:id/unfollow
  ///
  /// - authenticated
  /// - write:follows
  Future<RelationshipResponse> unfollow(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/unfollow",
      authenticated: true,
    );

    return Response.from(response.body, Relationship.fromJson);
  }

  /// Find out whether a given account is followed, blocked, muted, etc.
  ///
  /// GET /api/v1/accounts/relationships
  ///
  /// - authenticated
  /// - read read:follows
  Future<RelationshipsResponse> relationships(List<String> ids) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/relationships",
      authenticated: true,
      payload: {
        "ids": ids,
      },
    );

    return Response.fromList(response.body, Relationship.fromJson);
  }

  /// Search for matching accounts by username or display name.
  ///
  /// GET /api/v1/accounts/search
  ///
  /// - authenticated
  /// - read read:accounts
  Future<AccountsResponse> searchAccounts(
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

    return Response.fromList(response.body, Account.fromJson);
  }
}
