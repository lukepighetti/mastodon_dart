import '../library.dart';
import '../../src/mock/endpoints/bookmarks.dart';

/// https://docs.joinmastodon.org/methods/accounts/bookmarks/
mixin Bookmarks on Authentication, Utilities implements MockBookmarks {
  /// Statuses the user has bookmarked.
  ///
  /// GET /api/v1/bookmarks
  ///
  /// - authenticated (requires user)
  /// - read read:favourites
  Future<List<Status>> bookmarks({int limit = 40}) async {
    final response = await request(
      Method.get,
      "/api/v1/bookmarks",
      authenticated: true,
      payload: {
        "limit": limit.toString(),
      },
    );

    final body = List<Map>.from(json.decode(response.body));

    /// TODO: implement link headers for pagination

    return body.map((m) => Status.fromJson(m)).toList();
  }

  /// Privately bookmark a status.
  ///
  /// POST /api/v1/statuses/:id/bookmark
  ///
  /// - authenticated
  /// - write write:bookmarks
  Future<Status> bookmark(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/bookmark",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }

  /// Remove a status from your private bookmarks.
  ///
  /// POST /api/v1/statuses/:id/unbookmark
  ///
  /// - authenticated
  /// - write write:bookmarks
  Future<Status> unbookmark(String id) async {
    final response = await request(
      Method.post,
      "/api/v1/statuses/$id/unbookmark",
      authenticated: true,
    );

    return Status.fromJson(json.decode(response.body));
  }
}
