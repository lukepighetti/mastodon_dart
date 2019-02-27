import 'package:mastodon/mastodon.dart';

class MockCustomEmojis {
  /// GET /api/v1/custom_emojis
  /// https://docs.joinmastodon.org/api/rest/custom-emojis/#get-api-v1-custom-emojis
  Future<List<Emoji>> emojis() =>
      Future.value(List.generate(5, (_) => Emoji.mock()));
}
