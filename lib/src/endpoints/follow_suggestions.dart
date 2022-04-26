import '../library.dart';

mixin FollowSuggestions on Authentication, Utilities {
  /// GET /api/v1/suggestions
  ///
  /// - authenticated (requires user)
  /// - read
  Future<List<Account>> suggestions() async {
    final response = await request(
      Method.get,
      "/api/v1/suggestions",
      authenticated: true,
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// DELETE /api/v1/suggestions/:account_id
  ///
  /// API docs claim this needs read permissions, but its probably write permissions
  ///
  /// - authenticated (requires user)
  /// - read
  Future<dynamic> removeSuggestion(String id) async {
    await request(
      Method.delete,
      "/api/v1/suggestions/$id",
      authenticated: true,
    );
  }
}
