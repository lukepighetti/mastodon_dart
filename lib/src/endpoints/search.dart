import '../authentication.dart';
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

    return Response.from(response.body, Results.fromJson);
  }
}
