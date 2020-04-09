import '../library.dart';

import '../../src/mock/endpoints/custom_emojis.dart';

mixin CustomEmojis on Authentication, Utilities implements MockCustomEmojis {
  /// GET /api/v1/custom_emojis
  ///
  /// - public
  /// - scope not specified
  Future<List<Emoji>> emojis() async {
    final response = await request(
      Method.get,
      "/api/v1/custom_emojis",
    );

    final body = List<Map>.from(json.decode(response.body));

    return body.map((m) => Emoji.fromJson(m)).toList();
  }
}
