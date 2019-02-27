import '../library.dart';

import '../../mock/endpoints/lists.dart';

mixin Lists on Authentication, Utilities implements MockLists {
  /// GET /api/v1/lists
  ///
  /// - authenticated (requires user)
  /// - read read:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#get-api-v1-lists
  Future<List<ListSummary>> lists() async {
    final response = await request(
      Method.get,
      "/api/v1/lists",
      authenticated: true,
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => ListSummary.fromJson(m)).toList();
  }

  /// GET /api/v1/accounts/:id/lists
  ///
  /// - authenticated (requires user)
  /// - read read:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#get-api-v1-accounts-id-lists
  Future<List<ListSummary>> listsByAccount(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/accounts/$id/lists",
      authenticated: true,
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => ListSummary.fromJson(m)).toList();
  }

  /// GET /api/v1/lists/:id/accounts
  ///
  /// - authenticated (requires user)
  /// - read read:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#get-api-v1-lists-id-accounts
  Future<List<Account>> listAccounts(String id, {int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/lists/$id/accounts",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// GET /api/v1/lists/:id
  ///
  /// - authenticated (requires user)
  /// - read read:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#get-api-v1-lists-id
  Future<ListSummary> list(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/lists/$id",
      authenticated: true,
    );

    return ListSummary.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/lists
  ///
  /// - authenticated (requires user)
  /// - write write:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#post-api-v1-lists
  Future<ListSummary> createList(String title) async {
    final response = await request(
      Method.post,
      "/api/v1/lists",
      authenticated: true,
      payload: {
        "title": title,
      },
    );

    return ListSummary.fromJson(json.decode(response.body));
  }

  /// PUT /api/v1/lists/:id
  ///
  /// - authenticated (requires user)
  /// - write write:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#put-api-v1-lists-id
  Future<ListSummary> updateList(String id, String title) async {
    final response = await request(
      Method.put,
      "/api/v1/lists/$id",
      authenticated: true,
      payload: {
        "title": title,
      },
    );

    return ListSummary.fromJson(json.decode(response.body));
  }

  /// DELETE /api/v1/lists/:id
  ///
  /// - authenticated (requires user)
  /// - write write:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#delete-api-v1-lists-id
  Future<dynamic> deleteList(String id) async {
    await request(
      Method.delete,
      "/api/v1/lists/$id",
      authenticated: true,
    );
  }

  /// POST /api/v1/lists/:id/accounts
  /// https://docs.joinmastodon.org/api/rest/lists/#post-api-v1-lists-id-accounts
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
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#delete-api-v1-lists-id-accounts
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
