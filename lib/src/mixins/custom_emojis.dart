import '../library.dart';

import '../mock/mixins/custom_emojis.dart';

mixin CustomEmojis on Authentication implements MockCustomEmojisMixin {
  /// GET /api/v1/custom_emojis
  ///
  /// - public
  /// - scope not specified
  ///
  /// https://docs.joinmastodon.org/api/rest/custom-emojis/#get-api-v1-custom-emojis
  Future<List<Emoji>> emojis() async {
    final uri = baseUrl.replace(
      path: "/api/v1/custom_emojis",
    );

    final response = await get(
      uri,
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Emoji.fromJson(m)).toList();
  }
}
