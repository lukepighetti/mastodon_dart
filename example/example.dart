import 'dart:io';

import 'package:mastodon/mastodon.dart';

main() async {
  final mastodon = Mastodon()
    ..baseUrl = Uri.parse(Platform.environment["BASE_URL"])
    ..key = Platform.environment["KEY"];

  final results = await mastodon.search("javascript");

  print(results.statuses.map((s) => [s.account.displayName, s.content]));
}
