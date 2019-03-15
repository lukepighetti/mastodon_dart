import 'dart:io';

import 'package:mastodon/mastodon.dart';

main() async {
  final baseUrl = Uri.parse(Platform.environment["BASE_URL"]);
  final token = Platform.environment["TOKEN"];

  final mastodon = Mastodon(baseUrl)..token = token;

  mastodon.publicTimelineStream().listen(print);
}
