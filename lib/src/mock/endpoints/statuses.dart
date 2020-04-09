import 'package:mastodon_dart/mastodon_dart.dart';

class MockStatuses {
  /// GET /api/v1/statuses/:id
  /// https://docs.joinmastodon.org/api/rest/statuses/#get-api-v1-statuses-id
  Future<Status> status(String id) => Future.value(Status.mock());

  /// GET /api/v1/statuses/:id/context
  /// https://docs.joinmastodon.org/api/rest/statuses/#get-api-v1-statuses-id-context
  Future<Context> context(String id) => Future.value(Context.mock());

  /// GET /api/v1/statuses/:id/card
  /// https://docs.joinmastodon.org/api/rest/statuses/#get-api-v1-statuses-id-card
  Future<Card> card(String id) => Future.value(Card.mock());

  /// GET /api/v1/statuses/:id/reblogged_by
  /// https://docs.joinmastodon.org/api/rest/statuses/#get-api-v1-statuses-id-reblogged-by
  Future<List<Account>> rebloggedBy(String id, {int limit = 40}) =>
      Future.value(List.generate(limit, (_) => Account.mock()));

  /// GET /api/v1/statuses/:id/favourited_by
  /// https://docs.joinmastodon.org/api/rest/statuses/#get-api-v1-statuses-id-favourited-by
  Future<List<Account>> favouritedBy(String id, {int limit = 40}) =>
      Future.value(List.generate(limit, (_) => Account.mock()));

  /// POST /api/v1/statuses
  /// https://docs.joinmastodon.org/api/rest/statuses/#post-api-v1-statuses
  Future<Status> publishStatus({
    String status,
    String inReplyToId,
    List<String> mediaIds,
    bool sensitive,
    String spoilerText,
    Visibility visibility,
    DateTime scheduledAt,
    dynamic language,
  }) =>
      Future.value(Status.mock());

  /// DELETE /api/v1/statuses/:id
  /// https://docs.joinmastodon.org/api/rest/statuses/#delete-api-v1-statuses-id
  Future<dynamic> deleteStatus(String id) => Future.value(null);

  /// POST /api/v1/statuses/:id/reblog
  /// https://docs.joinmastodon.org/api/rest/statuses/#post-api-v1-statuses-id-reblog
  Future<Status> reblog(String id) => Future.value(Status.mock());

  /// POST /api/v1/statuses/:id/unreblog
  /// https://docs.joinmastodon.org/api/rest/statuses/#post-api-v1-statuses-id-unreblog
  Future<Status> unreblog(String id) => Future.value(Status.mock());

  /// POST /api/v1/statuses/:id/pin
  /// https://docs.joinmastodon.org/api/rest/statuses/#post-api-v1-statuses-id-pin
  Future<Status> pinStatus(String id) => Future.value(Status.mock());

  /// POST /api/v1/statuses/:id/unpin
  /// https://docs.joinmastodon.org/api/rest/statuses/#post-api-v1-statuses-id-unpin
  Future<Status> unpinStatus(String id) => Future.value(Status.mock());
}
