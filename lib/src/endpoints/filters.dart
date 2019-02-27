import '../library.dart';

import '../../mock/endpoints/filters.dart';

mixin Filters on Authentication, Utilities implements MockFilters {
  /// GET /api/v1/filters
  ///
  /// - authenticated (requires user)
  /// - read read:filters
  ///
  /// https://docs.joinmastodon.org/api/rest/filters/#get-api-v1-filters
  Future<List<Filter>> filters() async {
    final response = await request(
      Method.get,
      "/api/v1/filters",
      authenticated: true,
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Filter.fromJson(m)).toList();
  }

  /// POST /api/v1/filters
  ///
  /// - authenticated (requires user)
  /// - write write:filters
  ///
  /// https://docs.joinmastodon.org/api/rest/filters/#post-api-v1-filters
  Future<Filter> createFilter(
    String phrase,
    List<FilterContext> context, {
    bool irreversible,
    bool wholeWord,
    Duration expiresIn,
  }) async {
    final response = await request(
      Method.post,
      "/api/v1/filters",
      authenticated: true,
      payload: {
        "phrase": phrase,
        "context": context.map((c) => c.toString().split(".").last),
        "irreversible": irreversible?.toString(),
        "whole_word": wholeWord?.toString(),
        "expires_in": expiresIn?.inSeconds,
      }..removeWhere((_, value) => value == null),
    );

    return Filter.fromJson(json.decode(response.body));
  }

  /// GET /api/v1/filters/:id
  ///
  /// - authenticated (requires user)
  /// - read read:filters
  ///
  /// https://docs.joinmastodon.org/api/rest/filters/#get-api-v1-filters-id
  Future<Filter> filter(String id) async {
    final response = await request(
      Method.get,
      "/api/v1/filters/$id",
      authenticated: true,
    );

    return Filter.fromJson(json.decode(response.body));
  }

  /// PUT /api/v1/filters/:id
  ///
  /// - authenticated (requires user)
  /// - write write:filters
  ///
  /// https://docs.joinmastodon.org/api/rest/filters/#put-api-v1-filters-id
  Future<Filter> updateFilter(
    String id,
    String phrase,
    List<FilterContext> context, {
    bool irreversible,
    bool wholeWord,
    Duration expiresIn,
  }) async {
    final response = await request(
      Method.put,
      "/api/v1/filters/$id",
      authenticated: true,
      payload: {
        "phrase": phrase,
        "context": context.map((c) => c.toString().split(".").last),
        "irreversible": irreversible?.toString(),
        "whole_word": wholeWord?.toString(),
        "expires_in": expiresIn?.inSeconds,
      }..removeWhere((_, value) => value == null),
    );

    return Filter.fromJson(json.decode(response.body));
  }

  /// DELETE /api/v1/filters/:id
  ///
  /// - authenticated (requires user)
  /// - write write:filters
  ///
  /// https://docs.joinmastodon.org/api/rest/filters/#delete-api-v1-filters-id
  Future<void> deleteFilter(String id) async {
    final response = await request(
      Method.delete,
      "/api/v1/filters/$id",
      authenticated: true,
    );

    return Filter.fromJson(json.decode(response.body));
  }
}
