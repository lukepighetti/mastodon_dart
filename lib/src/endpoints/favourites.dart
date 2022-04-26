import '../library.dart';

/// https://docs.joinmastodon.org/methods/accounts/favourites/
mixin Favourites on Authentication, Utilities {
  /// GET /api/v1/favourites
  ///
  /// - authenticated (requires user)
  /// - read read:favourites
  Future<List<Status>> favourites({int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/favourites",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body.map((m) => Status.fromJson(m)).toList();
  }

  /// POST /api/v1/statuses/:id/favourite
  ///
  /// - authenticated (requires user)
  /// - write write:favourites
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
  Future<Status> unfavourite(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/unfavourite",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }
}
