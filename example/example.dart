import 'dart:io';

import 'package:mastodon/mastodon.dart';

main() async {
  final mastodon = Mastodon()
    ..baseUrl = Uri.parse(Platform.environment["BASE_URL"])
    ..key = Platform.environment["KEY"];

  final statuses = await mastodon.publicTimeline(limit: 5);

  print(statuses.map((s) => [s.id, s.account.displayName]));
  print(statuses.length);
}
