import '../library.dart';

import '../mock/mixins/scheduled_statuses.dart';

mixin ScheduledStatuses on Authentication
    implements MockScheduledStatusesMixin {
  /// GET /api/v1/scheduled_statuses
  ///
  /// - authenticated (requires user)
  /// - read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/scheduled-statuses/#get-api-v1-scheduled-statuses
  Future<List<ScheduledStatus>> scheduledStatuses() async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/scheduled_statuses",
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => ScheduledStatus.fromJson(m)).toList();
  }

  /// GET /api/v1/scheduled_statuses/:id
  ///
  /// - authenticated (requires user)
  /// - read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/scheduled-statuses/#get-api-v1-scheduled-statuses-id
  Future<ScheduledStatus> scheduledStatus(String id) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/scheduled_statuses/$id",
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return ScheduledStatus.fromJson(json.decode(response.body));
  }

  /// PUT /api/v1/scheduled_statuses/:id
  ///
  /// - authenticated (requires user)
  /// - write write:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/scheduled-statuses/#put-api-v1-scheduled-statuses-id
  Future<ScheduledStatus> updateScheduledStatus(String id,
      {DateTime scheduledAt}) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/scheduled_statuses/$id",
      queryParameters: {
        "scheduled_at": scheduledAt?.toIso8601String(),
      },
    );

    final response = await put(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return ScheduledStatus.fromJson(json.decode(response.body));
  }

  /// DELETE /api/v1/scheduled_statuses/:id
  ///
  /// - authenticated (requires user)
  /// - write write:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/scheduled-statuses/#delete-api-v1-scheduled-statuses-id
  Future<dynamic> deleteScheduledStatus(String id) async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/scheduled_statuses/$id",
    );

    await delete(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );
  }
}
