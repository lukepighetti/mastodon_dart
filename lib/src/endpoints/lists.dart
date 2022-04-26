import '../library.dart';

mixin Lists on Authentication, Utilities {
  /// GET /api/v1/lists
  ///
  /// - authenticated (requires user)
  /// - read read:lists
  Future<List<UserFollowsList>> lists() async {
    final response = await request(
      Method.get,
      "/api/v1/lists",
      authenticated: true,
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    return body.map((m) => UserFollowsList.fromJson(m)).toList();
  }

  /// GET /api/v1/accounts/:id/lists
  ///
  /// - authenticated (requires user)
  /// - read read:lists
  Future<List<UserFollowsList>> listsByAccount(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/$id/lists",
      authenticated: true,
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    return body.map((m) => UserFollowsList.fromJson(m)).toList();
  }

  /// GET /api/v1/lists/:id/accounts
  ///
  /// - authenticated (requires user)
  /// - read read:lists
  Future<List<Account>> listAccounts(String id, {int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/lists/$id/accounts",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// GET /api/v1/lists/:id
  ///
  /// - authenticated (requires user)
  /// - read read:lists
  Future<UserFollowsList> list(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/lists/$id",
      authenticated: true,
    );

    return UserFollowsList.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/lists
  ///
  /// - authenticated (requires user)
  /// - write write:lists
  Future<UserFollowsList> createList(String title) async {
    final response = await request(
      Method.post,
      "/api/v1/lists",
      authenticated: true,
      payload: {
        "title": title,
      },
    );

    return UserFollowsList.fromJson(json.decode(response.body));
  }

  /// PUT /api/v1/lists/:id
  ///
  /// - authenticated (requires user)
  /// - write write:lists
  Future<UserFollowsList> updateList(String id, String title) async {
    final response = await request(
      Method.put,
      "/api/v1/lists/$id",
      authenticated: true,
      payload: {
        "title": title,
      },
    );

    return UserFollowsList.fromJson(json.decode(response.body));
  }

  /// DELETE /api/v1/lists/:id
  ///
  /// - authenticated (requires user)
  /// - write write:lists
  Future<dynamic> deleteList(String id) async {
    await request(
      Method.delete,
      "/api/v1/lists/$id",
      authenticated: true,
    );
  }

  /// POST /api/v1/lists/:id/accounts
  ///
  /// - authenticated (requires user)
  /// - write write:lists
  ///
  /// Only accounts already followed by the user can be added to a list
  Future<dynamic> addAccountsToList(String id, List<String> ids) async {
    await request(
      Method.post,
      "/api/v1/lists/$id/accounts",
      authenticated: true,
      payload: {
        "account_ids": ids,
      },
    );
  }

  /// DELETE /api/v1/lists/:id/accounts
  ///
  /// - authenticated (requires user)
  /// - write write:lists
  Future<dynamic> deleteAccountsFromList(String id, List<String> ids) async {
    await request(
      Method.delete,
      "/api/v1/lists/$id/accounts",
      authenticated: true,
      payload: {
        "account_ids": ids,
      },
    );
  }
}
