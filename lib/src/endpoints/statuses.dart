import '../library.dart';
import '../../src/mock/endpoints/statuses.dart';

mixin Statuses on Authentication, Utilities implements MockStatuses {
  /// GET /api/v1/statuses/:id
  ///
  /// - public
  /// - read read:statuses
  Future<Status> status(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/statuses/$id",
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// GET /api/v1/statuses/:id/context
  ///
  /// - public / authenticated
  /// - read read:statuses
  ///
  /// NOTE: Public if the status is public
  Future<Context> context(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/statuses/$id/context",
    );

    return Context.fromJson(json.decode(response.body));
  }

  /// GET /api/v1/statuses/:id/card
  ///
  /// - public
  /// - read read:statuses
  Future<Card> card(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/statuses/$id/card",
    );

    final map = Map<String, dynamic>.from(json.decode(response.body));

    if (map.isEmpty) {
      return null;
    } else {
      return Card.fromJson(map);
    }
  }

  /// GET /api/v1/statuses/:id/reblogged_by
  ///
  /// - public
  /// - read read:statuses
  Future<List<Account>> rebloggedBy(String id, {int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/statuses/$id/reblogged_by",
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// GET /api/v1/statuses/:id/favourited_by
  ///
  /// - public
  /// - read read:statuses
  Future<List<Account>> favouritedBy(String id, {int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/statuses/$id/favourited_by",
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// POST /api/v1/statuses
  ///
  /// - authenticated
  /// - write write:statuses
  Future<Status> publishStatus({
    String status,
    String inReplyToId,
    List<String> mediaIds,
    bool sensitive = false,
    String spoilerText,
    Visibility visibility,
    DateTime scheduledAt,
    dynamic language,
  }) async {
    assert(status != null || (mediaIds != null && mediaIds.isNotEmpty));

    final response = await request(
      Method.post,
      "/api/v1/statuses",
      authenticated: true,
      payload: {
        "status": status,
        "in_reply_to_id": inReplyToId,
        "media_ids": mediaIds,
        "sensitive": "$sensitive",
        "visibility": visibility?.toString()?.split(".")?.last,
        "scheduled_at": scheduledAt?.toIso8601String(),
        "language": language?.toString(),
      },
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// DELETE /api/v1/statuses/:id
  ///
  /// - authenticated
  /// - write write:statuses
  Future<void> deleteStatus(String id) async {
    try {
      await request(
        Method.delete,
        "/api/v1/statuses/$id",
        authenticated: true,
      );
    } on MastodonException catch (e) {
      if (e.statusCode == 404) {
        throw MastodonException(404, "mastodon_dart_error",
            "Cannot delete a status that does not exist");
      }
    }
  }

  /// POST /api/v1/statuses/:id/reblog
  ///
  /// - authenticated
  /// - write write:statuses
  Future<Status> reblog(String id) async {
    Response response;

    try {
      response = await request(
        Method.post,
        "/api/v1/statuses/$id/reblog",
        authenticated: true,
      );
    } on MastodonException catch (e) {
      if (e.statusCode == 404) {
        throw MastodonException(404, "mastodon_dart_error",
            "Cannot reblog a status that does not exist");
      }
    }

    return Status.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/unreblog
  ///
  /// - authenticated
  /// - write write:statuses
  Future<Status> unreblog(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/unreblog",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/pin
  ///
  /// - authenticated
  /// - write write:statuses
  Future<Status> pinStatus(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/pin",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/unpin
  ///
  /// - authenticated
  /// - write write:statuses
  Future<Status> unpinStatus(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/unpin",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }
}
