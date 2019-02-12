import 'package:mastodon/mastodon.dart';

main() async {
  final mastodon = MockMastodon();

  mastodon.followers("anyString").then(print);
}
