import '../library.dart';
import '../mock/mixins/statuses.dart';

mixin Statuses on Authentication implements MockStatusesMixin {
  /// GET /api/v1/statuses/:id
  ///
  /// - public
  /// - read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/statuses/#get-api-v1-statuses-id
  Future<Status> status(String id) async {
    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/statuses/$id",
    );

    final response = await get(
      uri,
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// GET /api/v1/statuses/:id/context
  ///
  /// - public
  /// - read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/statuses/#get-api-v1-statuses-id-context
  Future<Context> context(String id) async {
    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/statuses/$id/context",
    );

    final response = await get(
      uri,
    );

    return Context.fromJson(json.decode(response.body));
  }

  /// GET /api/v1/statuses/:id/card
  ///
  /// - public
  /// - read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/statuses/#get-api-v1-statuses-id-card
  Future<Card> card(String id) async {
    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/statuses/$id/card",
    );

    final response = await get(
      uri,
    );

    final map = Map<String, dynamic>.from(json.decode(response.body));

    if (map.isEmpty)
      return null;
    else
      return Card.fromJson(map);
  }

  /// GET /api/v1/statuses/:id/reblogged_by
  ///
  /// - public
  /// - read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/statuses/#get-api-v1-statuses-id-reblogged-by
  Future<List<Account>> rebloggedBy(String id, {int limit = 40}) async {
    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/statuses/$id/reblogged_by",
      queryParameters: {
        "limit": limit.toString(),
      },
    );

    final response = await get(
      uri,
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// GET /api/v1/statuses/:id/favourited_by
  ///
  /// - public
  /// - read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/statuses/#get-api-v1-statuses-id-favourited-by
  Future<List<Account>> favouritedBy(String id, {int limit = 40}) async {
    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/statuses/$id/favourited_by",
      queryParameters: {
        "limit": limit.toString(),
      },
    );

    final response = await get(
      uri,
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// POST /api/v1/statuses
  ///
  /// - authenticated
  /// - write write:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/statuses/#post-api-v1-statuses
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
    assert(key != null);

    assert(status != null || (mediaIds != null && mediaIds.isNotEmpty));

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/statuses",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
      body: {
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
  ///
  /// https://docs.joinmastodon.org/api/rest/statuses/#delete-api-v1-statuses-id
  Future<void> deleteStatus(String id) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/statuses/$id",
    );

    final response = await delete(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    if (response.statusCode == 404) {
      throw MastodonException(
          404, "Cannot delete a status that does not exist");
    }
  }

  /// POST /api/v1/statuses/:id/reblog
  ///
  /// - authenticated
  /// - write write:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/statuses/#post-api-v1-statuses-id-reblog
  Future<Status> reblog(String id) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/statuses/$id/reblog",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    if (response.statusCode == 404) {
      throw MastodonException(
          404, "Cannot reblog a status that does not exist");
    }

    return Status.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/unreblog
  ///
  /// - authenticated
  /// - write write:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/statuses/#post-api-v1-statuses-id-unreblog
  Future<Status> unreblog(String id) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/statuses/$id/unreblog",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/pin
  ///
  /// - authenticated
  /// - write write:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/statuses/#post-api-v1-statuses-id-pin
  Future<Status> pinStatus(String id) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/statuses/$id/pin",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/unpin
  ///
  /// - authenticated
  /// - write write:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/statuses/#post-api-v1-statuses-id-unpin
  Future<Status> unpinStatus(String id) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/statuses/$id/unpin",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return Status.fromJson(json.decode(response.body));
  }
}
