import 'dart:io';

import 'package:mastodon/mastodon.dart';

main() async {
  final baseUrl = Uri.parse(Platform.environment["BASE_URL"]);
  final key = Platform.environment["KEY"];

  final mastodon = Mastodon(baseUrl)..key = key;

  final results = await mastodon.search("javascript");

  print(results.statuses.map((s) => [s.tags.map((t) => t.name), s.content]));
}
