import '../library.dart';

import '../../src/mock/endpoints/endorsements.dart';

mixin Endorsements on Authentication, Utilities implements MockEndorsements {
  /// GET /api/v1/endorsements
  ///
  /// - authenticated
  /// - read read:account
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
  Future<Relationship> unpin(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/unpin",
      authenticated: true,
    );

    return Relationship.fromJson(json.decode(response.body));
  }
}
