import 'package:mastodon_dart/mastodon_dart.dart';

class MockLists {
  /// GET /api/v1/lists
  /// https://docs.joinmastodon.org/api/rest/lists/#get-api-v1-lists

  Future<List<UserFollowsList>> lists() =>
      Future.value(List.generate(15, (_) => UserFollowsList.mock()));

  /// GET /api/v1/accounts/:id/lists
  /// https://docs.joinmastodon.org/api/rest/lists/#get-api-v1-accounts-id-lists
  Future<List<UserFollowsList>> listsByAccount(String id) =>
      Future.value(List.generate(15, (_) => UserFollowsList.mock()));

  /// GET /api/v1/lists/:id/accounts
  /// https://docs.joinmastodon.org/api/rest/lists/#get-api-v1-lists-id-accounts
  Future<List<Account>> listAccounts(String id, {int limit = 40}) =>
      Future.value(List.generate(40, (_) => Account.mock()));

  /// GET /api/v1/lists/:id
  /// https://docs.joinmastodon.org/api/rest/lists/#get-api-v1-lists-id
  Future<UserFollowsList> list(String id) => Future.value(UserFollowsList.mock());

  /// POST /api/v1/lists
  /// https://docs.joinmastodon.org/api/rest/lists/#post-api-v1-lists
  Future<UserFollowsList> createList(String title) =>
      Future.value(UserFollowsList.mock());

  /// PUT /api/v1/lists/:id
  /// https://docs.joinmastodon.org/api/rest/lists/#put-api-v1-lists-id
  Future<UserFollowsList> updateList(String id, String title) =>
      Future.value(UserFollowsList.mock());

  /// DELETE /api/v1/lists/:id
  /// https://docs.joinmastodon.org/api/rest/lists/#delete-api-v1-lists-id
  Future<dynamic> deleteList(String id) => Future.value(null);

  /// POST /api/v1/lists/:id/accounts
  /// https://docs.joinmastodon.org/api/rest/lists/#post-api-v1-lists-id-accounts
  ///
  /// Only accounts already followed by the user can be added to a list
  Future<dynamic> addAccountsToList(String id, List<String> ids) =>
      Future.value(null);

  /// DELETE /api/v1/lists/:id/accounts
  /// https://docs.joinmastodon.org/api/rest/lists/#delete-api-v1-lists-id-accounts
  Future<dynamic> deleteAccountsFromList(String id, List<String> ids) =>
      Future.value(null);
}
