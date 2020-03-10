import 'package:mastodon_dart/mastodon_dart.dart';

class MockEndorsements {
  /// GET /api/v1/endorsements
  /// https://docs.joinmastodon.org/api/rest/endorsements/#get-api-v1-endorsements
  ///
  /// TODO: implement link headers for pagination
  Future<List<Account>> endorsements() =>
      Future.value(List.generate(20, (_) => Account.mock()));

  /// POST /api/v1/accounts/:id/pin
  /// https://docs.joinmastodon.org/api/rest/endorsements/#post-api-v1-accounts-id-pin
  Future<Relationship> pin(String id) => Future.value(Relationship.mock());

  /// POST /api/v1/accounts/:id/unpin
  /// https://docs.joinmastodon.org/api/rest/endorsements/#post-api-v1-accounts-id-unpin
  Future<Relationship> unpin(String id) => Future.value(Relationship.mock());
}
