import 'dart:convert';

import '../authentication.dart';
import '../models/results.dart';
import '../utilities.dart';

mixin Search on Authentication, Utilities {
  /// GET /api/v2/search
  ///
  /// - authenticated
  /// - read read:search
  Future<Results> search(String q, {bool resolve = false}) async {
    final response = await request(
      Method.get,
      "/api/v2/search",
      authenticated: true,
      payload: {
        "q": q,
        "resolve": resolve.toString(),
      },
    );

    return Results.fromJson(json.decode(response.body));
  }
}
