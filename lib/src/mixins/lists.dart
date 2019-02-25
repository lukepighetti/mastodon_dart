import '../library.dart';

import 'package:mastodon/mock/mixins/lists.dart';

mixin Lists on Authentication implements MockListsMixin {
  /// GET /api/v1/lists
  ///
  /// - authenticated (requires user)
  /// - read read:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#get-api-v1-lists
  Future<List<ListSummary>> lists() => throw UnimplementedError();

  /// GET /api/v1/accounts/:id/lists
  ///
  /// - authenticated (requires user)
  /// - read read:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#get-api-v1-accounts-id-lists
  Future<List<ListSummary>> listsByAccount(String id) =>
      throw UnimplementedError();

  /// GET /api/v1/lists/:id/accounts
  ///
  /// - authenticated (requires user)
  /// - read read:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#get-api-v1-lists-id-accounts
  Future<List<Account>> listAccounts(String id, {int limit = 40}) =>
      throw UnimplementedError();

  /// GET /api/v1/lists/:id
  ///
  /// - authenticated (requires user)
  /// - read read:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#get-api-v1-lists-id
  Future<ListSummary> list(String id) => throw UnimplementedError();

  /// POST /api/v1/lists
  ///
  /// - authenticated (requires user)
  /// - write write:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#post-api-v1-lists
  Future<ListSummary> createList(String title) => throw UnimplementedError();

  /// PUT /api/v1/lists/:id
  ///
  /// - authenticated (requires user)
  /// - write write:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#put-api-v1-lists-id
  Future<ListSummary> updateList(String id, String title) =>
      throw UnimplementedError();

  /// DELETE /api/v1/lists/:id
  ///
  /// - authenticated (requires user)
  /// - write write:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#delete-api-v1-lists-id
  Future<dynamic> deleteList(String id) => throw UnimplementedError();

  /// POST /api/v1/lists/:id/accounts
  /// https://docs.joinmastodon.org/api/rest/lists/#post-api-v1-lists-id-accounts
  ///
  /// - authenticated (requires user)
  /// - write write:lists
  ///
  /// Only accounts already followed by the user can be added to a list
  Future<dynamic> addAccountsToList(List<String> ids) =>
      throw UnimplementedError();

  /// DELETE /api/v1/lists/:id/accounts
  ///
  /// - authenticated (requires user)
  /// - write write:lists
  ///
  /// https://docs.joinmastodon.org/api/rest/lists/#delete-api-v1-lists-id-accounts
  Future<dynamic> deleteAccountsFromList(List<String> ids) =>
      throw UnimplementedError();
}
