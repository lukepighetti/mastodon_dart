import 'dart:convert';

import '../authentication.dart';
import '../models/account.dart';
import '../utilities.dart';

mixin FollowRequests on Authentication, Utilities {
  /// GET /api/v1/follow_requests
  ///
  /// - authenticated (requires user)
  /// - read read:follows
  Future<List<Account>> followRequests({int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/follow_requests",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination
    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// POST /api/v1/follow_requests/:id/authorize
  ///
  /// - authenticated (requires user)
  /// - write:follows
  Future<dynamic> authorizeRequest(String id) async {
    await request(
      Method.post,
      "/api/v1/follow_requests/$id/authorize",
      authenticated: true,
    );
  }

  /// POST /api/v1/follow_requests/:id/reject
  ///
  /// - authenticated (requires user)
  /// - write:follows
  Future<dynamic> rejectRequest(String id) async {
    await request(
      Method.post,
      "/api/v1/follow_requests/$id/reject",
      authenticated: true,
    );
  }
}
