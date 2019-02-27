import 'package:mastodon/mastodon.dart';

class MockFollowSuggestions {
  /// GET /api/v1/suggestions
  /// https://docs.joinmastodon.org/api/rest/follow-suggestions/#get-api-v1-suggestions
  Future<List<Account>> suggestions() =>
      Future.value(List.generate(15, (_) => Account.mock()));

  /// DELETE /api/v1/suggestions/:account_id
  /// https://docs.joinmastodon.org/api/rest/follow-suggestions/#delete-api-v1-suggestions-account-id
  Future<dynamic> removeSuggestion(String id) => Future.value(dynamic);
}
