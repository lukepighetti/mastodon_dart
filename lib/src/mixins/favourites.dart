import '../library.dart';

import '../mock/mixins/favourites.dart';

mixin Favourites on Authentication implements MockFavouritesMixin {
  /// GET /api/v1/favourites
  ///
  /// - authenticated (requires user)
  /// - read read:favourites
  ///
  /// https://docs.joinmastodon.org/api/rest/favourites/#get-api-v1-favourites
  Future<List<Status>> favourites({int limit = 40}) async {
    assert(key != null);

    final uri = baseUrl.replace(
      path: "/api/v1/favourites",
      queryParameters: {
        "limit": limit.toString(),
      },
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    final body = List<Map>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body.map((m) => Status.fromJson(m)).toList();
  }

  /// POST /api/v1/statuses/:id/favourite
  ///
  /// - authenticated (requires user)
  /// - write write:favourites
  ///
  /// https://docs.joinmastodon.org/api/rest/favourites/#post-api-v1-statuses-id-favourite
  Future<Status> favorite(String id) async {
    assert(key != null);

    final uri = baseUrl.replace(
      path: "/api/v1/statuses/$id/favourite",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// POST /api/v1/statuses/:id/unfavourite
  ///
  /// Unspecified permissions, it is probably:
  ///
  /// - authenticated (requires user)
  /// - write write:favourites
  ///
  /// https://docs.joinmastodon.org/api/rest/favourites/#post-api-v1-statuses-id-unfavourite
  Future<Status> unfavorite(String id) async {
    assert(key != null);

    final uri = baseUrl.replace(
      path: "/api/v1/statuses/$id/unfavourite",
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return Status.fromJson(json.decode(response.body));
  }
}
