import '../authentication.dart';
import '../models/conversation.dart';
import '../models/status.dart';
import '../response.dart';
import '../result.dart';
import '../utilities.dart';

typedef TimelineResponse = Response<List<Result<Status>>>;
typedef ConversationResponse = Response<List<Result<Conversation>>>;

mixin Timelines on Authentication, Utilities {
  /// GET /api/v1/timelines/home
  ///
  /// - authenticated
  /// - read read:statuses
  Future<TimelineResponse> timeline({
    String? maxId,
    String? sinceId,
    String? minId,
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

    return Response.fromList(response.body, Status.fromJson);
  }

  /// GET /api/v1/conversations
  ///
  /// authenticated
  /// read read:statuses
  Future<ConversationResponse> conversations({
    String? maxId,
    String? sinceId,
    String? minId,
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

    return Response.fromList(response.body, Conversation.fromJson);
  }

  /// GET /api/v1/timelines/public
  ///
  /// - public
  /// - read read:statuses
  Future<TimelineResponse> publicTimeline({
    bool local = false,
    bool remote = false,
    bool onlyMedia = false,
    String? maxId,
    String? sinceId,
    String? minId,
    int limit = 20,
  }) async {
    final response = await request(
      Method.get,
      "/api/v1/timelines/public",
      authenticated: true,
      payload: {
        "local": "$local",
        "remote": "$remote",
        "only_media": "$onlyMedia",
        "max_id": maxId,
        "since_id": sinceId,
        "min_id": minId,
        "limit": "$limit",
      },
    );

    return Response.fromList(response.body, Status.fromJson);
  }

  /// GET /api/v1/timelines/tag/:hashtag
  ///
  /// - public
  /// - read read:statuses
  Future<TimelineResponse> hashtagTimeline(
    String hashtag, {
    bool local = false,
    bool onlyMedia = false,
    String? maxId,
    String? sinceId,
    String? minId,
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

    return Response.fromList(response.body, Status.fromJson);
  }

  /// GET /api/v1/timelines/list/:list_id
  ///
  /// - authenticated
  /// - read read:statuses
  Future<TimelineResponse> listTimeline(
    String id, {
    bool? local,
    bool? onlyMedia,
    String? maxId,
    String? sinceId,
    String? minId,
    int limit = 20,
  }) =>
      throw UnimplementedError();
}
