import 'dart:convert';

import '../authentication.dart';
import '../exception.dart';
import '../models/results.dart';
import '../response.dart';
import '../result.dart';
import '../utilities.dart';

typedef SearchResponse = Response<Result<Results>>;

mixin Search on Authentication, Utilities {
  /// GET /api/v2/search
  ///
  /// - authenticated
  /// - read read:search
  Future<SearchResponse> search(
    String q, {
    bool resolve = false,
  }) async {
    final response = await request(
      Method.get,
      "/api/v2/search",
      authenticated: true,
      payload: {
        "q": q,
        "resolve": resolve.toString(),
      },
    );

    try {
      return Response(
        Result.success(
          Results.fromJson(json.decode(response.body)),
        ),
      );
    } on Exception catch (e) {
      return Response(
        Result.failure(
          ResultException(
            exception: e,
            unparsed: response.body,
          ),
        ),
      );
    }
  }
}
