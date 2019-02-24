import 'dart:io';

import 'package:mastodon/mastodon.dart';

main() async {
  final mastodon = Mastodon()
    ..baseUrl = Uri.parse(Platform.environment["BASE_URL"])
    ..key = Platform.environment["KEY"];

  final status = await mastodon.publishStatus(status: "boink!");

  print([status.id, status.content, status.account.username]);

  await mastodon.pinStatus(status.id);
  // await mastodon.unreblog(status.id);
}
