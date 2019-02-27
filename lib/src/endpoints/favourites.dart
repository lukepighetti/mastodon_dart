import '../library.dart';

import '../mock/endpoints/favourites.dart';

mixin Favourites on Authentication, Utilities implements MockFavouritesMixin {
  /// GET /api/v1/favourites
  ///
  /// - authenticated (requires user)
  /// - read read:favourites
  ///
  /// https://docs.joinmastodon.org/api/rest/favourites/#get-api-v1-favourites
  Future<List<Status>> favourites({int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/favourites",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
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
  Future<Status> favourite(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/favourite",
      authenticated: true,
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
  Future<Status> unfavourite(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/unfavourite",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }
}
