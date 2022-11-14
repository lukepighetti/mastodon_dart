import 'dart:convert';

import '../authentication.dart';
import '../models/account.dart';
import '../models/relationship.dart';
import '../utilities.dart';

mixin Endorsements on Authentication, Utilities {
  /// GET /api/v1/endorsements
  ///
  /// - authenticated
  /// - read read:account
  Future<List<Account>> endorsements() async {
    final response = await request(
      Method.get,
      "/api/v1/endorsements",
      authenticated: true,
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination
    return body.map((m) => Account.fromJson(m)).toList();
  }

  /// POST /api/v1/accounts/:id/pin
  ///
  /// - authenticated
  /// - write write:accounts
  Future<Relationship> pin(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/pin",
      authenticated: true,
    );

    return Relationship.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/accounts/:id/unpin
  ///
  /// - authenticated
  /// - write write:accounts
  Future<Relationship> unpin(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/accounts/$id/unpin",
      authenticated: true,
    );

    return Relationship.fromJson(json.decode(response.body));
  }
}
