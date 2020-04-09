import '../library.dart';

import '../../src/mock/endpoints/reports.dart';

mixin Reports on Authentication, Utilities implements MockReports {
  /// POST /api/v1/reports
  ///
  /// - authenticated (requires user)
  /// - write write:reports
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
