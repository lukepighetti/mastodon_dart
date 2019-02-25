import '../library.dart';

import 'package:mastodon/mock/mixins/scheduled_statuses.dart';

mixin ScheduledStatuses on Authentication
    implements MockScheduledStatusesMixin {
  /// GET /api/v1/scheduled_statuses
  ///
  /// - authenticated (requires user)
  /// - read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/scheduled-statuses/#get-api-v1-scheduled-statuses
  Future<List<ScheduledStatus>> scheduledStatuses() =>
      throw UnimplementedError();

  /// GET /api/v1/scheduled_statuses/:id
  ///
  /// - authenticated (requires user)
  /// - read read:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/scheduled-statuses/#get-api-v1-scheduled-statuses-id
  Future<ScheduledStatus> scheduledStatus(String id) =>
      throw UnimplementedError();

  /// PUT /api/v1/scheduled_statuses/:id
  ///
  /// - authenticated (requires user)
  /// - write write:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/scheduled-statuses/#put-api-v1-scheduled-statuses-id
  Future<ScheduledStatus> updateScheduledStatus(String id,
          {DateTime scheduledAt}) =>
      throw UnimplementedError();

  /// DELETE /api/v1/scheduled_statuses/:id
  ///
  /// - authenticated (requires user)
  /// - write write:statuses
  ///
  /// https://docs.joinmastodon.org/api/rest/scheduled-statuses/#delete-api-v1-scheduled-statuses-id
  Future<dynamic> deleteScheduledStatus(String id) =>
      throw UnimplementedError();
}
