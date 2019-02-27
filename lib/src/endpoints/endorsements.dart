import '../library.dart';

import '../mock/endpoints/endorsements.dart';

mixin Endorsements
    on Authentication, Utilities
    implements MockEndorsementsMixin {
  /// GET /api/v1/endorsements
  ///
  /// - authenticated
  /// - read read:account
  ///
  /// https://docs.joinmastodon.org/api/rest/endorsements/#get-api-v1-endorsements
  ///
  Future<List<Account>> endorsements() async {
    final response = await request(
      Method.get,
      "/api/v1/endorsements",
      authenticated: true,
    );

    final body = List<Map>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// POST /api/v1/accounts/:id/pin
  ///
  /// - authenticated
  /// - write write:accounts
  ///
  /// https://docs.joinmastodon.org/api/rest/endorsements/#post-api-v1-accounts-id-pin
  Future<Relationship> pin(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/pin",
      authenticated: true,
    );

    return Relationship.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/accounts/:id/unpin
  ///
  /// - authenticated
  /// - write write:accounts
  ///
  /// https://docs.joinmastodon.org/api/rest/endorsements/#post-api-v1-accounts-id-unpin
  Future<Relationship> unpin(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/unpin",
      authenticated: true,
    );

    return Relationship.fromJson(json.decode(response.body));
  }
}
