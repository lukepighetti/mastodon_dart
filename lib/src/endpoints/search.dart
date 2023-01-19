import 'dart:convert';

import '../authentication.dart';
import '../exception.dart';
import '../model.dart';
import '../response.dart';
import '../models/results.dart';
import '../utilities.dart';

typedef SearchResponse = Response<Model<Results>>;

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
        Model.success(
          Results.fromJson(json.decode(response.body)),
        ),
      );
    } on Exception catch (e) {
      return Response(
        Model.failure(
          ModelException(
            exception: e,
            unparsed: response.body,
          ),
        ),
      );
    }
  }
}
