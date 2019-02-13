import 'package:mastodon/mastodon.dart';

class MockTimelinesMixin {
  /// GET /api/v1/timelines/home
  /// https://docs.joinmastodon.org/api/rest/timelines/#get-api-v1-timelines-home
  Future<List<Status>> timeline(
          {String maxId, String sinceId, String minId, int limit = 20}) =>
      Future.value(List.generate(limit, (_) => Status.mock()));

  /// GET /api/v1/conversations
  /// https://docs.joinmastodon.org/api/rest/timelines/#get-api-v1-conversations
  Future<List<Conversation>> conversations(
          {String maxId, String sinceId, String minId, int limit = 20}) =>
      Future.value(List.generate(limit, (_) => Conversation.mock()));

  /// GET /api/v1/timelines/public
  /// https://docs.joinmastodon.org/api/rest/timelines/#get-api-v1-timelines-public
  Future<List<Status>> publicTimeline({
    bool local,
    bool onlyMedia,
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
  }) =>
      Future.value(List.generate(limit, (_) => Status.mock()));

  /// GET /api/v1/timelines/tag/:hashtag
  /// https://docs.joinmastodon.org/api/rest/timelines/#get-api-v1-timelines-tag-hashtag
  Future<List<Status>> hashtagTimeline(
    String hashtag, {
    bool local,
    bool onlyMedia,
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
  }) =>
      Future.value(List.generate(limit, (_) => Status.mock()));

  /// GET /api/v1/timelines/list/:list_id
  /// https://docs.joinmastodon.org/api/rest/timelines/#get-api-v1-timelines-list-list-id
  Future<List<Status>> listTimeline(
    String id, {
    bool local,
    bool onlyMedia,
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
  }) =>
      Future.value(List.generate(limit, (_) => Status.mock()));
}
