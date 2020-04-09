import '../library.dart';
import '../../src/mock/endpoints/search.dart';

mixin Search on Authentication, Utilities implements MockSearch {
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
