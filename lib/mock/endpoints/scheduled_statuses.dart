import 'package:mastodon_dart/mastodon.dart';

class MockScheduledStatuses {
  /// GET /api/v1/scheduled_statuses
  /// https://docs.joinmastodon.org/api/rest/scheduled-statuses/#get-api-v1-scheduled-statuses
  Future<List<ScheduledStatus>> scheduledStatuses() =>
      Future.value(List.generate(10, (_) => ScheduledStatus.mock()));

  /// GET /api/v1/scheduled_statuses/:id
  /// https://docs.joinmastodon.org/api/rest/scheduled-statuses/#get-api-v1-scheduled-statuses-id
  Future<ScheduledStatus> scheduledStatus(String id) =>
      Future.value(ScheduledStatus.mock());

  /// PUT /api/v1/scheduled_statuses/:id
  /// https://docs.joinmastodon.org/api/rest/scheduled-statuses/#put-api-v1-scheduled-statuses-id
  Future<ScheduledStatus> updateScheduledStatus(String id,
          {DateTime scheduledAt}) =>
      Future.value(ScheduledStatus.mock());

  /// DELETE /api/v1/scheduled_statuses/:id
  /// https://docs.joinmastodon.org/api/rest/scheduled-statuses/#delete-api-v1-scheduled-statuses-id
  Future<dynamic> deleteScheduledStatus(String id) => Future.value(null);
}
