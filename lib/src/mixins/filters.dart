import '../library.dart';

import '../mock/mixins/filters.dart';

mixin Filters on Authentication implements MockFiltersMixin {
  /// GET /api/v1/filters
  ///
  /// - authenticated (requires user)
  /// - read read:filters
  ///
  /// https://docs.joinmastodon.org/api/rest/filters/#get-api-v1-filters
  Future<List<Filter>> filters() async {
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/filters",
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/filters",
      queryParameters: {
        "phrase": phrase,
        "context": context.map((c) => c.toString().split(".").last),
        "irreversible": irreversible?.toString(),
        "whole_word": wholeWord?.toString(),
        "expires_in": expiresIn?.inSeconds,
      }..removeWhere((_, value) => value == null),
    );

    final response = await post(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/filters/$id",
    );

    final response = await get(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/filters/$id",
      queryParameters: {
        "phrase": phrase,
        "context": context.map((c) => c.toString().split(".").last),
        "irreversible": irreversible?.toString(),
        "whole_word": wholeWord?.toString(),
        "expires_in": expiresIn?.inSeconds,
      }..removeWhere((_, value) => value == null),
    );

    final response = await put(
      uri,
      headers: {"Authorization": "Bearer $key"},
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
    assert(key != null);

    final uri = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: "/api/v1/filters/$id",
    );

    final response = await delete(
      uri,
      headers: {"Authorization": "Bearer $key"},
    );

    return Filter.fromJson(json.decode(response.body));
  }
}
