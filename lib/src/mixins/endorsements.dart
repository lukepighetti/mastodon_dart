import '../library.dart';

import 'package:mastodon/mock/mixins/endorsements.dart';

mixin Endorsements on Authentication implements MockEndorsementsMixin {
  /// GET /api/v1/endorsements
  ///
  /// - authenticated
  /// - read read:account
  ///
  /// https://docs.joinmastodon.org/api/rest/endorsements/#get-api-v1-endorsements
  ///
  Future<List<Account>> endorsements() async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/endorsements",
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/$id/pin",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/$id/unpin",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return Relationship.fromJson(json.decode(response.body));
  }
}
