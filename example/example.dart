import 'dart:io';

import 'package:mastodon/mastodon.dart';

main() async {
  final mastodon = Mastodon()
    ..baseUrl = Uri.parse(Platform.environment["BASE_URL"])
    ..key = Platform.environment["KEY"];

  final timeline = await mastodon.timeline();

  print(timeline.map((t) => [t.account.username, t.favouritesCount]));
}
