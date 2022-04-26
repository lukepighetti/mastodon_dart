import 'dart:convert';

import '../authentication.dart';
import '../data/emoji.dart';
import '../utilities.dart';

mixin CustomEmojis on Authentication, Utilities {
  /// GET /api/v1/custom_emojis
  ///
  /// - public
  /// - scope not specified
  Future<List<Emoji>> emojis() async {
    final response = await request(
      Method.get,
      "/api/v1/custom_emojis",
    );

    final body = List<Map<String, dynamic>>.from(json.decode(response.body));

    return body.map((m) => Emoji.fromJson(m)).toList();
  }
}
