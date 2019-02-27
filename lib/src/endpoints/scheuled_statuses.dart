import '../library.dart';

import '../mock/endpoints/scheduled_statuses.dart';

mixin ScheduledStatuses
    on Authentication, Utilities
    implements MockScheduledStatusesMixin {
  /// GET /api/v1/scheduled_statuses
  ///
  /// - authenticated (requires user)
  /// - read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/scheduled-statuses/#get-api-v1-scheduled-statuses
  Future<List<ScheduledStatus>> scheduledStatuses() async {
    final response = await request(
      Method.get,
      "/api/v1/scheduled_statuses",
      authenticated: true,
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
    final response = await request(
      Method.get,
      "/api/v1/scheduled_statuses/$id",
      authenticated: true,
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
    final response = await request(
      Method.put,
      "/api/v1/scheduled_statuses/$id",
      authenticated: true,
      payload: {
        "scheduled_at": scheduledAt?.toIso8601String(),
      },
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
    await request(
      Method.delete,
      "/api/v1/scheduled_statuses/$id",
      authenticated: true,
    );
  }
}
