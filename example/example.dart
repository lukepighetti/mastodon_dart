import 'dart:io';

import 'package:mastodon_dart/mastodon_dart.dart';
import 'package:web_socket_channel/io.dart';

main() async {
  final baseUrl = Uri.parse(Platform.environment["BASE_URL"]);
  final token = Platform.environment["TOKEN"];

  final mastodon = Mastodon(
    baseUrl,
    websocketFactory: (uri) => IOWebSocketChannel.connect(uri),
  )..token = token;

  mastodon.publicTimelineStream().listen(print);
}
