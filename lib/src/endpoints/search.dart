import 'dart:convert';

import '../authentication.dart';
import '../exception.dart';
import '../model.dart';
import '../model_response.dart';
import '../models/results.dart';
import '../utilities.dart';

mixin Search on Authentication, Utilities {
  /// GET /api/v2/search
  ///
  /// - authenticated
  /// - read read:search
  Future<ModelResponse<Results>> search(
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
      return ModelResponse(
        Model.success(
          Results.fromJson(json.decode(response.body)),
        ),
      );
    } on Exception catch (e) {
      return ModelResponse(
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
