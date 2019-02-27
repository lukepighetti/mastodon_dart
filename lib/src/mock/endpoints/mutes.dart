import 'package:mastodon/mastodon.dart';

class MockMutes {
  /// GET /api/v1/mutes
  /// https://docs.joinmastodon.org/api/rest/mutes/#get-api-v1-mutes
  Future<List<Account>> mutes({int limit = 40}) =>
      Future.value(List.generate(limit, (_) => Account.mock()));

  /// POST /api/v1/accounts/:id/mute
  /// https://docs.joinmastodon.org/api/rest/mutes/#post-api-v1-accounts-id-mute
  Future<Relationship> muteAccount(String id) =>
      Future.value(Relationship.mock());

  /// POST /api/v1/accounts/:id/unmute
  /// https://docs.joinmastodon.org/api/rest/mutes/#post-api-v1-accounts-id-unmute
  Future<Relationship> unmuteAccount(String id) =>
      Future.value(Relationship.mock());

  /// POST /api/v1/statuses/:id/mute
  /// https://docs.joinmastodon.org/api/rest/mutes/#post-api-v1-statuses-id-mute
  Future<Status> muteStatus(String id) => Future.value(Status.mock());

  /// POST /api/v1/statuses/:id/unmute
  /// https://docs.joinmastodon.org/api/rest/mutes/#post-api-v1-statuses-id-unmute
  Future<Status> unmuteStatus(String id) => Future.value(Status.mock());
}
