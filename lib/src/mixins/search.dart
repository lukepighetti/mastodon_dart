import '../library.dart';
import 'package:mastodon/mock/mixins/search.dart';

// mixin Statuses on Authentication implements MockStatusesMixin {

mixin Search on Authentication implements MockSearchMixin {
  /// GET /api/v2/search
  ///
  /// - authenticated
  /// - read read:search
  ///
  /// https://docs.joinmastodon.org/api/rest/search/#get-api-v2-search
  Future<Results> search(String q, {bool resolve = false}) async {
    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v2/search",
      queryParameters: {
        "q": q,
        "resolve": resolve.toString(),
      },
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return Results.fromJson(json.decode(response.body));
  }
}
