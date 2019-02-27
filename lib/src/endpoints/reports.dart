import '../library.dart';

import '../mock/endpoints/reports.dart';

mixin Reports on Authentication, Utilities implements MockReportsMixin {
  /// POST /api/v1/reports
  ///
  /// - authenticated (requires user)
  /// - write write:reports
  ///
  /// https://docs.joinmastodon.org/api/rest/reports/#post-api-v1-reports
  Future<dynamic> report(
    String id, {
    List<String> statusIds,
    String comment,
    bool forward,
  }) async {
    await request(
      Method.post,
      "/api/v1/reports",
      authenticated: true,
      payload: {
        "account_id": id,
        "status_ids": statusIds,
        "comment": comment,
        "forward": forward?.toString(),
      },
    );
  }
}
