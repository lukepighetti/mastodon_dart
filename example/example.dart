import 'dart:io';

import 'package:mastodon/mastodon.dart';

main() async {
  final mastodon = Mastodon()
    ..baseUrl = Uri.parse(Platform.environment["BASE_URL"])
    ..key = Platform.environment["KEY"];

  final conversations = await mastodon.conversations();

  print(conversations.map((c) => [c.id, c.accounts.first.username]));
}
