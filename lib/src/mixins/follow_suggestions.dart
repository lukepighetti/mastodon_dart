import '../library.dart';

import 'package:mastodon/mock/mixins/follow_suggestions.dart';

mixin FollowSuggestions on Authentication
    implements MockFollowSuggestionsMixin {
  /// GET /api/v1/suggestions
  ///
  /// - authenticated (requires user)
  /// - read
  ///
  /// https://docs.joinmastodon.org/api/rest/follow-suggestions/#get-api-v1-suggestions
  Future<List<Account>> suggestions() async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/suggestions",
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/suggestions/$id",
    );

    await delete(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );
  }
}
