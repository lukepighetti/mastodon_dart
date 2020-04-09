import '../library.dart';
import '../../src/mock/endpoints/timelines.dart';

mixin Timelines on Authentication, Utilities implements MockTimelines {
  /// GET /api/v1/timelines/home
  ///
  /// - authenticated
  /// - read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/timelines/#get-api-v1-timelines-home
  Future<List<Status>> timeline({
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
  }) async {
    final response = await request(
      Method.get,
      "/api/v1/timelines/home",
      authenticated: true,
      payload: {
        "max_id": maxId,
        "since_id": sinceId,
        "min_id": minId,
        "limit": limit.toString(),
      },
    );

    return List<Status>.from(
      json.decode(response.body).map((json) => Status.fromJson(json)),
    );
  }

  /// GET /api/v1/conversations
  ///
  /// authenticated
  /// read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/timelines/#get-api-v1-conversations
  Future<List<Conversation>> conversations({
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
  }) async {
    final response = await request(
      Method.get,
      "/api/v1/conversations",
      authenticated: true,
      payload: {
        "max_id": maxId,
        "since_id": sinceId,
        "min_id": minId,
        "limit": limit.toString(),
      },
    );

    return List<Conversation>.from(
      json.decode(response.body).map((json) => Conversation.fromJson(json)),
    );
  }

  /// GET /api/v1/timelines/public
  ///
  /// - public
  /// - read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/timelines/#get-api-v1-timelines-public
  Future<List<Status>> publicTimeline({
    bool local = false,
    bool onlyMedia = false,
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
  }) async {
    final response = await request(
      Method.get,
      "/api/v1/timelines/public",
      authenticated: true,
      payload: {
        "local": "$local",
        "only_media": "$onlyMedia",
        "max_id": maxId,
        "since_id": sinceId,
        "min_id": minId,
        "limit": "$limit",
      },
    );

    return List<Status>.from(
      json.decode(response.body).map((json) => Status.fromJson(json)),
    );
  }

  /// GET /api/v1/timelines/tag/:hashtag
  ///
  /// - public
  /// - read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/timelines/#get-api-v1-timelines-tag-hashtag
  Future<List<Status>> hashtagTimeline(
    String hashtag, {
    bool local = false,
    bool onlyMedia = false,
    String maxId,
    String sinceId,
    String minId,
    int limit = 20,
  }) async {
    final response = await request(
      Method.get,
      "/api/v1/timelines/tag/$hashtag",
      authenticated: true,
      payload: {
        "local": "$local",
        "only_media": "$onlyMedia",
        "max_id": maxId,
        "since_id": sinceId,
        "min_id": minId,
        "limit": "$limit",
      },
    );

    return List<Status>.from(
      json.decode(response.body).map((json) => Status.fromJson(json)),
    );
  }

  /// GET /api/v1/timelines/list/:list_id
  ///
  /// - authenticated
  /// - read read:statuses
  ///
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
      throw UnimplementedError();
}
