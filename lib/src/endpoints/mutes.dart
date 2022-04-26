import 'dart:convert';

import '../authentication.dart';
import '../data/account.dart';
import '../data/relationship.dart';
import '../data/status.dart';
import '../utilities.dart';

mixin Mutes on Authentication, Utilities {
  /// GET /api/v1/mutes
  ///
  /// - authentication (requires user)
  /// - read:mutes follow
  Future<List<Account>> mutes({int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/mutes",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination
    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// POST /api/v1/accounts/:id/mute
  ///
  /// - authentication (requires user)
  /// - write:mutes follow
  Future<Relationship> muteAccount(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/mute",
      authenticated: true,
    );

    return Relationship.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/accounts/:id/unmute
  ///
  /// - authentication (requires user)
  /// - write:mutes follow
  Future<Relationship> unmuteAccount(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/unmute",
      authenticated: true,
    );

    return Relationship.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/mute
  ///
  /// - authentication (requires user)
  /// - write write:mutes
  Future<Status> muteStatus(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/mute",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/unmute
  ///
  /// - authentication (requires user)
  /// - write write:mutes
  Future<Status> unmuteStatus(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/unmute",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }
}
