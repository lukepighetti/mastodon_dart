import '../library.dart';

import '../mock/endpoints/custom_emojis.dart';

mixin CustomEmojis on Authentication, Utilities implements MockCustomEmojis {
  /// GET /api/v1/custom_emojis
  ///
  /// - public
  /// - scope not specified
  ///
  /// https://docs.joinmastodon.org/api/rest/custom-emojis/#get-api-v1-custom-emojis
  Future<List<Emoji>> emojis() async {
    final response = await request(
      Method.get,
      "/api/v1/custom_emojis",
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Emoji.fromJson(m)).toList();
  }
}
