import '../library.dart';

import '../../mock/endpoints/follow_suggestions.dart';

mixin FollowSuggestions
    on Authentication, Utilities
    implements MockFollowSuggestions {
  /// GET /api/v1/suggestions
  ///
  /// - authenticated (requires user)
  /// - read
  ///
  /// https://docs.joinmastodon.org/api/rest/follow-suggestions/#get-api-v1-suggestions
  Future<List<Account>> suggestions() async {
    final response = await request(
      Method.get,
      "/api/v1/suggestions",
      authenticated: true,
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// DELETE /api/v1/suggestions/:account_id
  ///
  /// API docs claim this needs read permissions, but its probably write permissions
  ///
  /// - authenticated (requires user)
  /// - read
  ///
  /// https://docs.joinmastodon.org/api/rest/follow-suggestions/#delete-api-v1-suggestions-account-id
  Future<dynamic> removeSuggestion(String id) async {
    await request(
      Method.delete,
      "/api/v1/suggestions/$id",
      authenticated: true,
    );
  }
}
