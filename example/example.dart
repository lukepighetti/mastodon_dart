import 'dart:io';

import 'package:mastodon/mastodon.dart';

main() async {
  final mastodon = Mastodon()
    ..baseUrl = Uri.parse(Platform.environment["BASE_URL"])
    ..key = Platform.environment["KEY"];

  final status = await mastodon.publishStatus(
    status: "boink!",
    visibility: Visibility.unlisted,
  );

  print([status.id, status.content, status.account.username]);

  final card = await mastodon.card(status.id);

  print([card.description, card.title, card.type, card.authorName]);

  await mastodon.deleteStatus(status.id);
}
