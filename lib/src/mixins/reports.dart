import '../library.dart';

import 'package:mastodon/mock/mixins/reports.dart';

mixin Reports on Authentication implements MockReportsMixin {
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/accounts/$id/pin",
      queryParameters: {
        "account_id": id,
        "status_ids": statusIds,
        "comment": comment,
        "forward": forward?.toString(),
      },
    );

    await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );
  }
}
